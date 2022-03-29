//
//  IndicateFriendsPresenter.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 28/03/22.
//

import Foundation

protocol IndicateFriendsPresenterLogic {
    func presentIndicateResult(response: IndicateFriendsModels.Indicate.Response)
}

class IndicateFriendsPresenter: IndicateFriendsPresenterLogic {
    
    weak var viewController: IndicateFriendsDisplay?
    
    func presentIndicateResult(response: IndicateFriendsModels.Indicate.Response) {
        let viewObject = IndicateFriendsModels.Indicate.ViewObject(title: response.title, message: response.message)
        viewController?.displayIndicateResult(viewObject: viewObject)
    }
}
