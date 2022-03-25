//
//  WorkshopsListInteractor.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 22/03/22.
//

import Foundation

protocol WorkshopsListInteractorLogic {
    func handleWorkshopsList()
}

class WorkshopsListInteractor: WorkshopsListInteractorLogic {
    
    var presenter: WorkshopsListPresenterLogic?
    
    func handleWorkshopsList() {
        WorkshopsRepository().getListWorkshops()
    }
}
