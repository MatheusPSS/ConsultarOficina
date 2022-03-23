//
//  ConsultWorkshopsPresenter.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 22/03/22.
//

import Foundation

protocol ConsultWorkshopsPresenterLogic {
    func presentWorkshopsList()
}

class ConsultWorkshopsPresenter: ConsultWorkshopsPresenterLogic {
    
    weak var viewController: ConsultWorkshopsDisplay?
    
    func presentWorkshopsList() {
        
    }
}
