//
//  ProductoCell.swift
//  DanielBernalPrueba
//
//  Created by MacBookMBA1 on 28/03/23.
//

import UIKit

class ProductoCell: UITableViewCell {
    
    @IBOutlet weak var labelNombre : UILabel!
    @IBOutlet weak var labelDescripcion : UILabel!
    @IBOutlet weak var labelPrecio : UILabel!
    
    static let identifier = "ProductoCell"
    static let nib = UINib(nibName: "ProductoCell", bundle: .main)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
