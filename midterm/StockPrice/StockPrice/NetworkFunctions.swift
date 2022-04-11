//
//  NetworkFunctions.swift
//  StockPrice
//
//  Created by 宋春雨 on 4/10/22.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON

func getCurrentURL(_ symbol : String) -> String {
    let url = "\(urlCompanyQuote)\(symbol)?apikey=\(apiKey)"
    return url
}

func getStockData (_ url : String) -> Promise<StockModel> {
    print(url)
    return Promise<StockModel> {seal -> Void in
        AF.request(url).responseJSON { response in

            if response.error != nil {

                seal.reject(response.error!)

            }

            let stockModel = StockModel("", "")

            // I will get data here
            
            let StockModel = JSON(response.data!).arrayValue
            //print temp
            print(StockModel)
            
            guard let stockJSON = StockModel.first else {return seal.fulfill(stockModel)}
            
            stockModel.companyName = stockJSON["name"].stringValue
            stockModel.symbol = stockJSON["symbol"].stringValue
            stockModel.price = stockJSON["price"].doubleValue
            stockModel.dayHigh = stockJSON["dayHigh"].doubleValue
            stockModel.dayLow = stockJSON["dayLow"].doubleValue
            


            seal.fulfill(stockModel) // I am fulfilling the promise

        }// end of response
    }
}
