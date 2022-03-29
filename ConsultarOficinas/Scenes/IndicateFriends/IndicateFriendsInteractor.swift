//
//  IndicateFriendsInteractor.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 28/03/22.
//

protocol IndicateFriendsInteractorLogic {
    func handleIndicate(request: IndicateFriendsModels.Indicate.Request)
}

class IndicateFriendsInteractor: IndicateFriendsInteractorLogic {
    
    var presenter: IndicateFriendsPresenterLogic?
    
    func handleIndicate(request: IndicateFriendsModels.Indicate.Request) {
        let request = IndicateRequest(
            codeAssociated: request.codeAssociated,
            documentNumber: request.documentNumber,
            emailAssociated: request.emailAssociated,
            nameAssociated: request.nameAssociated,
            telephoneAssociated: request.telephoneAssociated,
            vehiclePlateAssociated: request.vehiclePlateAssociated,
            nameFriend: request.nameFriend,
            emailFriend: request.emailFriend,
            telephoneFriend: request.telephoneFriend,
            observation: request.observation
        )
        
        IndicateRepository().indicateFriend(request: request) { [presenter] result in
            switch result {
            case .success(_):
                presenter?.presentIndicateResult(response: .init(title: "Sucesso :)", message: "Indicacao enviada com sucesso!"))
            case .failure(_):
                presenter?.presentIndicateResult(response: .init(title: "Ops!", message: "Falha ao enviar indicação!"))
            }
        }
    }
}
