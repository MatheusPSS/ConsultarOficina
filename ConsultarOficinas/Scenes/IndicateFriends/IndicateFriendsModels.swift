//
//  IndicateFriendsModels.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 28/03/22.
//

import Foundation

struct IndicateFriendsModels {
    enum Indicate {
        struct Request {
            var codeAssociated: Int
            var documentNumber: String
            var emailAssociated: String
            var nameAssociated: String
            var telephoneAssociated: String
            var vehiclePlateAssociated: String
            var nameFriend: String
            var emailFriend: String
            var telephoneFriend: String
            var observation: String
        }
        
        struct Response {
            var title: String
            var message: String
        }
        
        struct ViewObject {
            var title: String
            var message: String
        }
    }
}
