//
//  ConsultWorkshopsViewController.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 25/03/22.
//

import UIKit

class ConsultWorkshopsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var codeAssociatedText: UITextField!
    @IBOutlet weak var documentNumberText: UITextField!
    @IBOutlet weak var consultBottom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setupUI() {
        codeAssociatedText.delegate = self
        documentNumberText.delegate = self
        consultBottom.layer.cornerRadius = 8
    }
    
    @IBAction func consult(_ sender: Any) {
        codeAssociatedText.resignFirstResponder()
        documentNumberText.resignFirstResponder()
        showList()
    }
    
    private func showList() {
        let vc = WorkshopListConfigurator().newInstance()
        vc.codeAssocieted = self.codeAssociatedText.text
        vc.documentNumber = self.documentNumberText.text
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
