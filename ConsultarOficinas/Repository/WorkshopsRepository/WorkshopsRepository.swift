//
//  ServicesWorkshop.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 23/03/22.
//

import Foundation

class WorkshopsRepository {
    
    typealias WorkshopsListResult = Swift.Result<WorkshopsListResponse, Error>
    
    func getListWorkshops(request: BaseRequest, completion: @escaping (WorkshopsListResult) -> Void) {
        BaseRepository().makeRequest(request: request) { (result: WorkshopsListResult) in
            switch result {
            case .success(let value):
                if let error = self.validApiError(value) {
                    completion(.failure(error))
                    return
                }
                completion(result)
            case .failure(_):
                completion(result)
            }
        }
    }
    
    private func validApiError(_ value: WorkshopsListResponse) -> NSError? {
        if let returnError = value.retornoErro.retornoErro {
            let error = NSError(
                domain: "ErrorAPI",
                code: -1,
                userInfo: ["message" : returnError]
            )
            return error
        } else if value.listaOficinas.isEmpty {
            let error = NSError(
                domain: "ErrorAPI",
                code: -2,
                userInfo: ["message" : "List is empty"]
            )
            return error
        }
        return nil
    }
}
