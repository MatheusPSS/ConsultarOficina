//
//  ConsultWorkshopsTableViewController.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 22/03/22.
//

import UIKit

class ConsultWorkshopsTableViewController: UITableViewController {
    
    var interactor: ConsultWorkshopsInteractorLogic?
    var router: ConsultWorkshopsRouterLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Oficinas"
        
        // add tab bar com dois itens, inicio & indicar amigos
        
        setupNavigationBar()
        setupCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupVIP()
        interactor?.handleWorkshopsList()
    }
    
    private func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.barTintColor = UIColor.hinovaBlue()
        navigationController?.navigationBar.tintColor = UIColor.white
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = UIColor.hinovaBlue()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }
    
    private func setupVIP() {
        let presenter = ConsultWorkshopsPresenter()
        let interactor = ConsultWorkshopsInteractor()
        let router = ConsultWorkshopsRouter()

        self.interactor = interactor
        self.router = router
        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
    }
    
    private func setupCell() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "WorkshopTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "workshopTableViewCell")
    }
}

// MARK: - Table view
extension ConsultWorkshopsTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "workshopTableViewCell") as? WorkshopTableViewCell else {
            preconditionFailure("Cannot dequeue WorkshopTableViewCell")
        }
        return cell
    }
}

// MARK: Display Logic
protocol ConsultWorkshopsDisplay: AnyObject {
    func displayWorkshopsList()
}

extension ConsultWorkshopsTableViewController: ConsultWorkshopsDisplay {
    
    func displayWorkshopsList() {
        
    }
}
