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
            var workshopsListResponse: [WorkshopsList]
        }
        
        struct ViewObject {
            var workshopsListViewObject: [WorkshopsList]
        }
        
        struct WorkshopsList {
            var id: Int?
            var foto: UIImage?
            var name: String?
            var description: String?
        }
    }
}
