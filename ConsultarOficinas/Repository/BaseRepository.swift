//
//  BaseRepository.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 24/03/22.
//

import Foundation

class BaseRepository: NSObject {
    
    static let repository: BaseRepository = {
        return BaseRepository()
    }()
        
    private lazy var session: URLSession = {
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        return session
    }()
    
    private let baseUrl = "https://app.hinovamobile.com.br/ProvaConhecimentoWebApi"
    
    func makeRequest<T: Decodable>(request: BaseRequest, response: @escaping (Swift.Result<T, Error>) -> Void) {
        guard let url = URL(string: "\(baseUrl)\(request.endpoint)") else { return }
        
        var requestTask = URLRequest(url: url)
        requestTask.httpMethod = request.method.rawValue
        
        if let body = request.body {
            guard let jsonData = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted) else {
                return
            }
            
            requestTask.setValue("application/json", forHTTPHeaderField: "Content-Type")
            requestTask.httpBody = jsonData
        }
        
        let task = session.dataTask(with: requestTask) { data, urlResponse, error in
            
            if let error = error as NSError? {
                response(.failure(error))
                return
            }
            
            if let responseTask = urlResponse as? HTTPURLResponse,
                (responseTask.statusCode < 200 || responseTask.statusCode >= 299) {
                let error = NSError(
                    domain: "ErrorHTTP",
                    code: responseTask.statusCode,
                    userInfo: ["message" : "HTTP error url reponse"]
                )
                response(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(
                    domain: "ErrorHTTPRequest",
                    code: -1,
                    userInfo: ["message" : "Erro data"]
                )
                response(.failure(error))
                return
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                response(.success(decodedObject))
            } catch let error {
                response(.failure(error))
            }
        }
        task.resume()
    }
    
    func validReturnError(_ object: RetornoErro) -> NSError? {
        if let returnError = object.retornoErro {
            let error = NSError(
                domain: "ErrorAPI",
                code: -1,
                userInfo: ["message" : returnError]
            )
            return error
        }
        return nil
    }
}

extension BaseRepository: URLSessionTaskDelegate { }

public protocol BaseRequest {
    
    var endpoint: String { get }
    var method: HttpMethod { get }
    var body: [String: Any]? { get }
}

extension BaseRequest {
    var body: [String: Any]? {
        return nil
    }
}

public enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}
