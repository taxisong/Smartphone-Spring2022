//
//  ViewController.swift
//  StockPrice
//
//  Created by 宋春雨 on 4/10/22.
//

import UIKit
import SwiftyJSON
import Alamofire
import PromiseKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SendStockDelegate {
    
    
    
//    let stocks = [ "FB", "AAPL", "GOOG", "MSFT", "AMZN"]
    var stocksModel: [StockModel]?

    @IBOutlet weak var lblCompanyName: UILabel!
    
    @IBOutlet weak var lblSymbol: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblDayHigh: UILabel!
    
    @IBOutlet weak var lblDayLow: UILabel!
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stocksModel = initializeStocks()
        getAAPLPrice()
    }
    
    var stocks = [StockModel]()
    
    func getAAPLPrice () {
        let currentURL = getCurrentURL("AAPL")
        
        getStockData(currentURL)
            .done { StockModel in
                self.sendStockData(StockModel)
            }
            .catch { error in
                print(error.localizedDescription)
            }
    }
    
    func sendStockData(_ stockModel: StockModel) {
        lblCompanyName.text = stockModel.companyName
        lblSymbol.text = stockModel.symbol
        lblPrice.text = "\(stockModel.price)"
        lblDayHigh.text = "\(stockModel.dayHigh)"
        lblDayLow.text = "\(stockModel.dayLow)"
    }
    

    func initializeStocks() -> [StockModel] {
            
            let FaceBook = StockModel("FaceBook", "FB");
            let Apple = StockModel("Apple", "AAPL");
            let Google = StockModel("Google", "GOOG");
            let Microsoft = StockModel("Microsoft", "MSFT");
            let Amazon = StockModel("Amazon", "AMZN");
            
            var modelArr = [StockModel]()
            
            // modelArr.append(currentLocation)
            modelArr.append(FaceBook)
            modelArr.append(Apple)
            modelArr.append(Google)
            modelArr.append(Microsoft)
            modelArr.append(Amazon)
            
            return modelArr
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows = stocksModel?.count else { return 0 }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("CustomTableViewCell", owner: self, options: nil)?.first as! CustomTableViewCell
                
        guard let stockModel = stocksModel?[indexPath.row] else { return cell }
                
        
        cell.lblCompanyName.text = stockModel.companyName
        cell.lblSymbol.text = stockModel.symbol
                
        cell.companyName = stockModel.companyName
        cell.symbol = stockModel.symbol

        cell.sendStockDelegate = self
        
        return cell
    }
    
}

