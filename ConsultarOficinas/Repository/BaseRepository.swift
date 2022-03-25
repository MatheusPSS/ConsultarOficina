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
    
    func makeRequest(request: BaseRequest) {
        guard let url = URL(string: "\(request.baseUrl)\(request.endpoint)") else { return }
        
        var requestTask = URLRequest(url: url)
        requestTask.httpMethod = request.method.rawValue
        
        let task = session.dataTask(with: requestTask) { data, response, error in
            
            if error != nil || data == nil {
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                return
            }
            
            guard let data = data else {
                return
            }

            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Could print JSON in String")
                    return
                }
                
                print(prettyPrintedJson)
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
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
