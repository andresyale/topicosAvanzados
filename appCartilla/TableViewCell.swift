//
//  TableViewCell.swift
//  appCartilla
//
//  Created by Andres Estrada on 30/11/20.
//  Copyright © 2020 Andres Estrada. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblSubtitulo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
