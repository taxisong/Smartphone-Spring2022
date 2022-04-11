//
//  ProtocolSendStockData.swift
//  StockPrice
//
//  Created by 宋春雨 on 4/10/22.
//

import Foundation

protocol SendStockDelegate {
    func sendStockData(_ stockModel : StockModel)
}
