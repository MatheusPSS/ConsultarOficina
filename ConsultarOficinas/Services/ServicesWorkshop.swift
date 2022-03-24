//
//  ServicesWorkshop.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 23/03/22.
//

import Foundation

class ServicesWorkshop: NSObject {
    
    let baseUrl = "https://app.hinovamobile.com.br/ProvaConhecimentoWebApi/Api/Oficina?codigoAssociacao=601&cpfAssociado="
    
    private lazy var session: URLSession = {
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        return session
    }()
    
    func getListWorkshops() {
        guard let url = URL(string: baseUrl) else { return }
        
        let task = session.dataTask(with: url) { data, response, error in
            
            if error != nil || data == nil {
                return
            }
            
//            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
//                return
//            }
//
//            guard let mime = response.mimeType, mime == "application/json" else {
//                return
//            }
            
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

extension ServicesWorkshop: URLSessionTaskDelegate {
    
}
