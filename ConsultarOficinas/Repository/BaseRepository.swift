//
//  BaseRepository.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 24/03/22.
//

import Foundation

class BaseRepository: NSObject {
        
    private lazy var session: URLSession = {
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        return session
    }()
    
    func makeRequest<T: Decodable>(request: BaseRequest, response: @escaping (Swift.Result<T, Error>) -> Void) {
        guard let url = URL(string: "\(request.baseUrl)\(request.endpoint)") else { return }
        
        var requestTask = URLRequest(url: url)
        requestTask.httpMethod = request.method.rawValue
        
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
}

extension BaseRepository: URLSessionTaskDelegate { }

class BaseRequest {
    let baseUrl = "https://app.hinovamobile.com.br/ProvaConhecimentoWebApi"
    
    public var endpoint: String {
        get {
            return ""
        }
    }
    
    public var method: HttpMethod {
        get {
            return .get
        }
    }
}

public enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}
