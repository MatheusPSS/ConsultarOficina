//
//  WorkshopsListInteractor.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 22/03/22.
//

import Foundation
import UIKit

protocol WorkshopsListInteractorLogic {
    func handleWorkshopsList(request: WorkshopdListModels.Consult.Request)
    var dataStore: [ListaOficina]? { get }
}

class WorkshopsListInteractor: WorkshopsListInteractorLogic {
    
    var presenter: WorkshopsListPresenterLogic?
    
    var dataStore: [ListaOficina]?
    
    typealias Workshops = WorkshopdListModels.Consult.WorkshopsList
    
    func handleWorkshopsList(request: WorkshopdListModels.Consult.Request) {
        let request = WorkshopsListRequest(
            codeAssociated: request.codeAssocieted ?? "",
            documentNumber: request.documentNumber ?? ""
        )
        
        WorkshopsRepository().getListWorkshops(request: request) { [presenter] result in
            switch result {
            case .success(let value):
                print(value)
                
                self.dataStore = value.listaOficinas
                
                presenter?.presentWorkshopsList(
                    response: .init(
                        workshopsListResponse: self.getList(value.listaOficinas)
                    )
                )
            case .failure(let error):
                print(error)
                presenter?.preswntErrorWorkshopsList()
            }
        }
    }
    
    private func getList(_ listaOficinas: [ListaOficina]) -> [Workshops] {
        var workshopsList = [Workshops]()
        var workshop = Workshops()
        
        for oficina in listaOficinas {
            workshop.id = oficina.id ?? 0
            workshop.name = oficina.nome ?? ""
            workshop.foto = getPhoto(oficina.foto ?? "")
            workshop.description = oficina.descricaoCurta
            
            workshopsList.append(workshop)
        }
        
        return workshopsList
    }
    
    private func getPhoto(_ image: String) -> UIImage {
        let foto: UIImage = UIImage()
        return foto
    }
}
