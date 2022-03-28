//
//  WorkshopTableViewCell.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 22/03/22.
//

import UIKit

class WorkshopTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configShowCell(_ object: WorkshopdListModels.Consult.WorkshopsList) {
        nameLabel.text = object.name
        descriptionLabel.text = object.description
        photo.image = object.photo
    }
}
