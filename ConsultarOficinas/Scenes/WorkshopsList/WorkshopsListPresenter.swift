//
//  WorkshopsListPresenter.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 22/03/22.
//

import Foundation

protocol WorkshopsListPresenterLogic {
    func presentWorkshopsList()
}

class WorkshopsListPresenter: WorkshopsListPresenterLogic {
    
    weak var viewController: WorkshopsListDisplay?
    
    func presentWorkshopsList() {
        
    }
}
