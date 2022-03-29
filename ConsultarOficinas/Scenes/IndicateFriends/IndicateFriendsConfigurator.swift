//
//  IndicateFriendsConfigurator.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 28/03/22.
//

import Foundation

class IndicateFriendsConfigurator {
    
    func newInstance() -> IndicateFriendsViewController {
        
        let viewController = IndicateFriendsViewController()
        let presenter = IndicateFriendsPresenter()
        let interactor = IndicateFriendsInteractor()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}

