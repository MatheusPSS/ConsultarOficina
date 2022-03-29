//
//  WorkshopdListModel.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 25/03/22.
//

import Foundation
import UIKit

struct WorkshopdListModels {
    
    enum Consult {
        struct Request {
            var codeAssocieted: String?
            var documentNumber: String?
        }
        
        struct Response {
            var workshopsListResponse: [Workshop]
        }
        
        struct ViewObject {
            var workshopsListViewObject: [Workshop]
        }
        
        struct Workshop {
            var id: Int?
            var photo: UIImage?
            var name: String?
            var shortDescription: String?
            var description: String?
            var email: String?
            var telephone: String?
            var telephoneTwo: String?
            var address: String?
            var latitude: String?
            var longitude: String?
        }
    }
}
