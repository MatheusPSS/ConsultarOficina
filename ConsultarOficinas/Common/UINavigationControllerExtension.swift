//
//  UINavigationControllerExtension.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 25/03/22.
//

import Foundation
import UIKit

extension UINavigationController {
    func setupNavigationBar() {
        setNavigationBarHidden(false, animated: true)
        navigationBar.barTintColor = UIColor.hinovaBlue()
        navigationBar.tintColor = UIColor.white
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = UIColor.hinovaBlue()
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
    }
}
