//
//  IndicateFriendsViewController.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 28/03/22.
//

import UIKit

class IndicateFriendsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak private var nameText: UITextField!
    @IBOutlet weak private var telephoneText: UITextField!
    @IBOutlet weak private var emailText: UITextField!
    @IBOutlet weak private var indicateButton: UIButton!
    
    var interactor: IndicateFriendsInteractorLogic?
    
    var workshopAssociated: WorkshopdListModels.Consult.Workshop?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.title = "Indicar amigos"
        self.navigationController?.setupNavigationBar()
        indicateButton.layer.cornerRadius = 8
        nameText.delegate = self
        telephoneText.delegate = self
        emailText.delegate = self
    }
    
    @IBAction func indicate(_ sender: Any) {
        indicateFriends()
    }
    
    private func indicateFriends() {
        interactor?.handleIndicate(request: .init(
            codeAssociated: 0,
            documentNumber: "",
            emailAssociated: workshopAssociated?.email ?? "",
            nameAssociated: workshopAssociated?.name ?? "",
            telephoneAssociated: workshopAssociated?.telephone ?? "",
            vehiclePlateAssociated: "",
            nameFriend: nameText.text ?? "",
            emailFriend: emailText.text ?? "",
            telephoneFriend: telephoneText.text ?? "",
            observation: "")
        )
    }
}

protocol IndicateFriendsDisplay: AnyObject {
    func displaySuccess()
}

extension IndicateFriendsViewController: IndicateFriendsDisplay {
    
    func displaySuccess() {
        
    }
}
