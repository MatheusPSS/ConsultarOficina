//
//  WorkshopsListViewController.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 25/03/22.
//

import UIKit

class WorkshopsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate var tableRows: [Int] = []
    var cellModel: WorkshopTableViewCellModel?
    
    var interactor: WorkshopsListInteractorLogic?
    var router: WorkshopsListRouterLogic?
    
    var codeAssocieted: String?
    var documentNumber: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCell()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        interactor?.handleWorkshopsList(request: .init(
            codeAssocieted: codeAssocieted,
            documentNumber: documentNumber
        ))
    }
    
    private func setupUI() {
        self.title = "Oficinas"
        self.navigationController?.setupNavigationBar()
        // add tab bar com dois itens, inicio & indicar amigos
    }
    
    private func setupCell() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "WorkshopTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "workshopTableViewCell")
    }
}

// MARK: - Table view
extension WorkshopsListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableRows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "workshopTableViewCell") as? WorkshopTableViewCell else {
            preconditionFailure("Cannot dequeue WorkshopTableViewCell")
        }
        cell.configShowCell(interactor?.dataStore?.first?.nome ?? "Test")
        return cell
    }
}

// MARK: Display Logic
protocol WorkshopsListDisplay: AnyObject {
    func displayWorkshopsList(_ name: String)
}

extension WorkshopsListViewController: WorkshopsListDisplay {
    
    func displayWorkshopsList(_ name: String) {
        tableRows = [1]
        cellModel?.name = name
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
}
