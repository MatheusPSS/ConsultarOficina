//
//  WorkshopsListRequest.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 24/03/22.
//

import Foundation

class WorkshopsListRequest: BaseRequest {
    
    private let codeAssociated: String
    private let documentNumber: String
    
    init(codeAssociated: String, documentNumber: String) {
        self.codeAssociated = codeAssociated
        self.documentNumber = documentNumber
    }
    
    var endpoint: String {
        return "/Api/Oficina?codigoAssociacao=\(codeAssociated)&cpfAssociado=\(documentNumber)"
    }
    
    var method: HttpMethod {
        return .get
    }
}
