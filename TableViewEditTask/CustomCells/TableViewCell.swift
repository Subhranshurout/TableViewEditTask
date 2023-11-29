//
//  TableViewCell.swift
//  TableViewEditTask
//
//  Created by Yudiz-subhranshu on 10/04/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var mnumLbl: UILabel!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var imgLbl: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
