//
//  WorkshopsListViewController.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 25/03/22.
//

import UIKit

class WorkshopsListViewController: UIViewController {
    
    @IBOutlet weak fileprivate var tableView: UITableView!
    var cellModel = [WorkshopdListModels.Consult.Workshop]()
    
    var interactor: WorkshopsListInteractorLogic?
    var router: WorkshopsListRouterLogic?
    
    var codeAssocieted: String?
    var documentNumber: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        interactor?.handleWorkshopsList(request: .init(
            codeAssocieted: codeAssocieted,
            documentNumber: documentNumber
        ))
    }
    
    private func setupUI() {
        self.title = "Oficinas"
        self.navigationController?.setupNavigationBar()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(indicateFriends))
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "WorkshopTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "workshopTableViewCell")
    }
    
    @objc private func indicateFriends() {
        guard let model = cellModel.first else {
            return
        }
        router?.routeIndicateFriends(model)
    }
    
    fileprivate func showAlertError(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (_) in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
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
        router?.routeDetailsWorkshop(detailsWorkshop: cellModel[indexPath.row])
    }
}

// MARK: Display Logic
protocol WorkshopsListDisplay: AnyObject {
    func displayWorkshopsList(viewObject: WorkshopdListModels.Consult.ViewObject)
    func displayShowError(_ title: String, _ message: String)
}

extension WorkshopsListViewController: WorkshopsListDisplay {
    
    func displayWorkshopsList(viewObject: WorkshopdListModels.Consult.ViewObject) {
        cellModel = viewObject.workshopsListViewObject
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func displayShowError(_ title: String, _ message: String) {
        DispatchQueue.main.async {
            self.showAlertError(title, message)
        }
    }
}
