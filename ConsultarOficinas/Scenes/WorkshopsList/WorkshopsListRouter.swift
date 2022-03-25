//
//  WorkshopsListRouter.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 22/03/22.
//

import Foundation

protocol WorkshopsListRouterLogic {
    func routeDetailsWorkshop()
}

class WorkshopsListRouter: WorkshopsListRouterLogic {
    
    weak var viewController: WorkshopsListDisplay?
    
    func routeDetailsWorkshop() {
        
    }
}
