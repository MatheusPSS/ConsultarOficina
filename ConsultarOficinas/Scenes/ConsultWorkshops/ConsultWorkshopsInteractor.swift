//
//  ConsultWorkshopsInteractor.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 22/03/22.
//

import Foundation

protocol ConsultWorkshopsInteractorLogic {
    func handleWorkshopsList()
}

class ConsultWorkshopsInteractor: ConsultWorkshopsInteractorLogic {
    
    var presenter: ConsultWorkshopsPresenterLogic?
    
    func handleWorkshopsList() {
        //chamar repositorio
    }
}
