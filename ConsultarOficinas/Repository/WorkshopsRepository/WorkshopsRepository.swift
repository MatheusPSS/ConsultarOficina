//
//  ServicesWorkshop.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 23/03/22.
//

import Foundation

class WorkshopsRepository {
    
    typealias WorkshopsListResult = Swift.Result<WorkshopsListResponse, Error>
    
    let repository = BaseRepository.repository
    
    func getListWorkshops(request: BaseRequest, completion: @escaping (WorkshopsListResult) -> Void) {
        repository.makeRequest(request: request) { (result: WorkshopsListResult) in
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
        if let returnError = repository.validReturnError(value.retornoErroWorkshops) {
            return returnError
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
