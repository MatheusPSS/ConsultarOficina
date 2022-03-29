//
//  WorkshopsListPresenter.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 22/03/22.
//

import Foundation

protocol WorkshopsListPresenterLogic {
    func presentWorkshopsList(response: WorkshopdListModels.Consult.Response)
    func preswntErrorWorkshopsList(_ title: String, _ message: String)
}

class WorkshopsListPresenter: WorkshopsListPresenterLogic {
    
    weak var viewController: WorkshopsListDisplay?
    
    func presentWorkshopsList(response: WorkshopdListModels.Consult.Response) {
        viewController?.displayWorkshopsList(viewObject: .init(
            workshopsListViewObject: response.workshopsListResponse)
        )
    }
    
    func preswntErrorWorkshopsList(_ title: String, _ message: String) {
        viewController?.displayShowError(title, message)
    }
}
