//
//  IndicateRepository.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 28/03/22.
//

import Foundation

class IndicateRepository {
    
    typealias IndicateResult = Swift.Result<IndicateResponse, Error>
    
    let repository = BaseRepository.repository
    
    func indicateFriend(request: BaseRequest, completion: @escaping (IndicateResult) -> Void) {
        repository.makeRequest(request: request) { [repository] (result: IndicateResult) in
            switch result {
            case .success(let value):
                if let error = repository.validReturnError(value.retornoErroIndicate) {
                    completion(.failure(error))
                    return
                }
                completion(result)
            case .failure(_):
                completion(result)
            }
        }
    }
}
