//
//  ConsultWorkshopsRouter.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 22/03/22.
//

import Foundation

protocol ConsultWorkshopsRouterLogic {
    func routeDetailsWorkshop()
}

class ConsultWorkshopsRouter: ConsultWorkshopsRouterLogic {
    
    weak var viewController: ConsultWorkshopsDisplay?
    
    func routeDetailsWorkshop() {
        
    }
}
