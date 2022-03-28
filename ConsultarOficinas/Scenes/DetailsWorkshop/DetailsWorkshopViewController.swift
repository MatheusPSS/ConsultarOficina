//
//  DetailsWorkshopViewController.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 28/03/22.
//

import UIKit
import MapKit

class DetailsWorkshopViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var telephoneLabel: UILabel!
    @IBOutlet weak var telephoneTwoLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!

    
    var detailsWorkshop: WorkshopdListModels.Consult.Workshop?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        nameLabel.text = detailsWorkshop?.name
        logoImage.image = detailsWorkshop?.photo
        descriptionLabel.text = detailsWorkshop?.description
        emailLabel.text = detailsWorkshop?.email
        telephoneLabel.text = detailsWorkshop?.telephone
        telephoneTwoLabel.text = detailsWorkshop?.telephoneTwo
        addressLabel.text = detailsWorkshop?.address
        setupLocation(
            latitude: detailsWorkshop?.latitude ?? "",
            longitude: detailsWorkshop?.longitude ?? ""
        )
        
    }
    
    private func setupLocation(latitude: String, longitude: String) {
        mapView.delegate = self
        
        let dbLat = Double(detailsWorkshop?.latitude ?? "")
        let dbLong = Double(detailsWorkshop?.longitude ?? "")
        
        let location = CLLocation(
            latitude: CLLocationDegrees(dbLat ?? 0),
            longitude: CLLocationDegrees(dbLong ?? 0)
        )
        
        let coordinateRegion = MKCoordinateRegion(
              center: location.coordinate,
              latitudinalMeters: 1000,
              longitudinalMeters: 1000
        )
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
}
