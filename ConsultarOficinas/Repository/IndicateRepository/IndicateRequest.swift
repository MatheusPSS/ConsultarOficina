//
//  IndicateRequest.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 28/03/22.
//

import Foundation

class IndicateRequest: BaseRequest {
    
    private let codeAssociated: Int
    private let documentNumber: String
    private let emailAssociated: String
    private let nameAssociated: String
    private let telephoneAssociated: String
    private let vehiclePlateAssociated: String
    private let nameFriend: String
    private let emailFriend: String
    private let telephoneFriend: String
    private let observation: String
    
    init(
        codeAssociated: Int,
        documentNumber: String,
        emailAssociated: String,
        nameAssociated: String,
        telephoneAssociated: String,
        vehiclePlateAssociated: String,
        nameFriend: String,
        emailFriend: String,
        telephoneFriend: String,
        observation: String
    ) {
        self.codeAssociated = codeAssociated
        self.documentNumber = documentNumber
        self.emailAssociated = emailAssociated
        self.nameAssociated = nameAssociated
        self.telephoneAssociated = telephoneAssociated
        self.vehiclePlateAssociated = vehiclePlateAssociated
        self.nameFriend = nameFriend
        self.emailFriend = emailFriend
        self.telephoneFriend = telephoneFriend
        self.observation = observation
    }
    
    var endpoint: String {
        return "/Api/Indicacao"
    }
    
    var method: HttpMethod {
        return .post
    }
    
    var body: [String : Any]? {
        var dictionary: [String : Any] = [:]
        var dictionaryIndicate: [String : Any] = [:]
        
        dictionaryIndicate = [
            "CodigoAssociacao": codeAssociated,
            "DataCriacao": "\(Date())",
            "CpfAssociado": documentNumber,
            "EmailAssociado": emailAssociated,
            "NomeAssociado": nameAssociated,
            "TelefoneAssociado": telephoneAssociated,
            "PlacaVeiculoAssociado": vehiclePlateAssociated,
            "NomeAmigo": nameFriend,
            "TelefoneAmigo": telephoneFriend,
            "EmailAmigo": emailFriend,
            "Observacao": observation
        ]
        
        dictionary = [
            "Indicacao": dictionaryIndicate,
            "Remetente": emailAssociated,
            "Copias": []
        ]
        return dictionary
    }
}
