//
//  StockViewController.swift
//  hw5
//
//  Created by 宋春雨 on 2/27/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class StockViewController: UIViewController {
    
    @IBOutlet weak var txtStockSymbol: UITextField!
    
    @IBOutlet weak var lblStockPrice: UILabel!
    @IBOutlet weak var lblCompanyName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func getStockPrice(_ sender: Any) {
        
        guard let symbol = txtStockSymbol.text else {return}
        
        let url = "\(urlQuote)\(symbol.uppercased())?apikey=\(apiKey)" //"https://financialmodelingprep.com/api/v3/quotes/nyse?apikey=215f712c641870be2e0d52f629d09843"
        
        print(url)
        
        SwiftSpinner.show("Getting stock value for \(symbol)")
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide(nil)
            if response.error != nil {
                print(response.error!)
            }
//            print(response.data!)
            let stocks = JSON(response.data!).array
            
            guard let stocks = stocks!.first else {return}
            
            print(stocks)
            
            let quote = Quote()
            quote.symbol = stocks["symbol"].stringValue
            quote.name = stocks["name"].stringValue
            quote.price = stocks["price"].floatValue
            quote.volume = stocks["volume"].intValue
            
            self.lblStockPrice.text = "\(quote.symbol) : \(quote.price) $"
            self.lblCompanyName.text = "\(quote.name)"
        }
    }
    
}
