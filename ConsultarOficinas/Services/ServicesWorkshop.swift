//
//  ServicesWorkshop.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 23/03/22.
//

import Foundation

class WorkshopRepository {
    
    private let repository = BaseRepository()
    
    func getListWorkshops() {
        repository.makeRequest(request: ListWorkshopRequest(codeAssociated: "601", documentNumber: ""))
    }
}

class ListWorkshopRequest: BaseRequest {
    
    private let codeAssociated: String
    private let documentNumber: String
    
    init(codeAssociated: String, documentNumber: String) {
        self.codeAssociated = codeAssociated
        self.documentNumber = documentNumber
    }
    
    override var endpoint: String {
        return "/Api/Oficina?codigoAssociacao=\(codeAssociated)&cpfAssociado=\(documentNumber)"
    }
    
    override var method: HttpMethod {
        return .get
    }
}

// MARK: Base

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
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print("The Response is : ",json)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
            
        }
        task.resume()
    }
}

extension BaseRepository: URLSessionTaskDelegate { }
