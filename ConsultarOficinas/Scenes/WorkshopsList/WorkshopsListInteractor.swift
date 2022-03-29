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
}

class WorkshopsListInteractor: WorkshopsListInteractorLogic {
    
    var presenter: WorkshopsListPresenterLogic?
        
    typealias Workshops = WorkshopdListModels.Consult.Workshop
    
    func handleWorkshopsList(request: WorkshopdListModels.Consult.Request) {
        let request = WorkshopsListRequest(
            codeAssociated: request.codeAssocieted ?? "",
            documentNumber: request.documentNumber ?? ""
        )
        
        WorkshopsRepository().getListWorkshops(request: request) { [presenter] result in
            switch result {
            case .success(let value):
                print(value)
                presenter?.presentWorkshopsList(
                    response: .init(
                        workshopsListResponse: self.getList(value.listaOficinas)
                    )
                )
            case .failure(let error):
                print(error)
                //criar cenario de erro com alert
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
            workshop.photo = getPhoto(oficina.foto ?? "")
            workshop.shortDescription = oficina.descricaoCurta
            workshop.description = oficina.descricao
            workshop.email = oficina.email
            workshop.telephone = oficina.telefone1
            workshop.telephoneTwo = oficina.telefone2
            workshop.address = oficina.endereco
            workshop.latitude = oficina.latitude
            workshop.longitude = oficina.longitude
            
            workshopsList.append(workshop)
        }
        
        return workshopsList
    }
    
    private func getPhoto(_ imageBase64String: String) -> UIImage {
        if let imageData = Data(base64Encoded: imageBase64String),
           let image = UIImage(data: imageData) {
            return image
        }
        return UIImage()
        
    }
}
