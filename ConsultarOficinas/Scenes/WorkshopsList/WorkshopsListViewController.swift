//
//  WorkshopsListViewController.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 25/03/22.
//

import UIKit

class WorkshopsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var cellModel = [WorkshopdListModels.Consult.WorkshopsList]()
    
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
        return cellModel.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "workshopTableViewCell") as? WorkshopTableViewCell else {
            preconditionFailure("Cannot dequeue WorkshopTableViewCell")
        }
        cell.configShowCell(cellModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //chamar tela de detalhes
        self.navigationController?.present(ConsultWorkshopsViewController(), animated: true)
    }
}

// MARK: Display Logic
protocol WorkshopsListDisplay: AnyObject {
    func displayWorkshopsList(viewObject: WorkshopdListModels.Consult.ViewObject)
}

extension WorkshopsListViewController: WorkshopsListDisplay {
    
    func displayWorkshopsList(viewObject: WorkshopdListModels.Consult.ViewObject) {
        cellModel = viewObject.workshopsListViewObject
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
