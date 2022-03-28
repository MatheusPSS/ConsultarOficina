//
//  WorkshopsListRouter.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 22/03/22.
//

import Foundation

protocol WorkshopsListRouterLogic {
    func routeDetailsWorkshop(detailsWorkshop: WorkshopdListModels.Consult.Workshop)
}

class WorkshopsListRouter: WorkshopsListRouterLogic {
    
    weak var viewController: (WorkshopsListViewController & WorkshopsListDisplay)?
    
    func routeDetailsWorkshop(detailsWorkshop: WorkshopdListModels.Consult.Workshop) {
        let vc = DetailsWorkshopViewController()
        vc.detailsWorkshop = detailsWorkshop
        viewController?.navigationController?.present(vc, animated: true)
    }
}
