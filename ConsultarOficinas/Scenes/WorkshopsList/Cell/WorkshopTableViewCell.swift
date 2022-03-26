//
//  WorkshopTableViewCell.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 22/03/22.
//

import UIKit

class WorkshopTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configShowCell(_ name: String) {
        nameLabel.text = name
    }
}

struct WorkshopTableViewCellModel {
    
    var name: String
}
