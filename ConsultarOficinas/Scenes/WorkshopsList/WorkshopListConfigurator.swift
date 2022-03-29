//
//  WorkshopListConfigurator.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 25/03/22.
//

import Foundation

class WorkshopListConfigurator {
    
    func newInstance() -> WorkshopsListViewController {
        
        let viewController = WorkshopsListViewController()
        let presenter = WorkshopsListPresenter()
        let interactor = WorkshopsListInteractor()
        let router = WorkshopsListRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
