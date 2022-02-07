//
//  TableViewCell.swift
//  TableviewxibFile
//
//  Created by 宋春雨 on 2/6/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblImage: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
