//
//  CustomTableViewCell.swift
//  StockPrice
//
//  Created by 宋春雨 on 4/10/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    
    var companyName = ""
    var symbol = ""
    var sendStockDelegate : SendStockDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func getPriceAction(_ sender: Any) {
        let currentURL = getCurrentURL(symbol)
        
        getStockData(currentURL)
            .done { StockModel in
                StockModel.companyName = self.companyName
                self.sendStockDelegate?.sendStockData(StockModel)
            }
            .catch { error in
                print(error.localizedDescription)
            }
    }
}
