//
//  IndicateFriendsPresenter.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 28/03/22.
//

import Foundation

protocol IndicateFriendsPresenterLogic {
    func presentIndicate()
    func presentErrorIndicate()
}

class IndicateFriendsPresenter: IndicateFriendsPresenterLogic {
    
    weak var viewController: IndicateFriendsDisplay?
    
    func presentIndicate() {
        
    }
    
    func presentErrorIndicate() {
        
    }
}
