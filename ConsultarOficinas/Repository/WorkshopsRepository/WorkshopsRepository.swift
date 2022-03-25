//
//  ServicesWorkshop.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 23/03/22.
//

import Foundation

class WorkshopsRepository {
    
    private let repository = BaseRepository()
    
    func getListWorkshops() {
        repository.makeRequest(request: WorkshopsListRequest(codeAssociated: "601", documentNumber: ""))
    }
}
