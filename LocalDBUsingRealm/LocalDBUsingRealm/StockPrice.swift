//
//  StockPrice.swift
//  LocalDBUsingRealm
//
//  Created by Wu Guanguan on 3/17/23.
//

import Foundation
import RealmSwift


class StockPrice: Object{
    @objc dynamic var symbol: String = ""
    @objc dynamic var price: Float = 0.0
    @objc dynamic var volume: Int64 = 0
    
    override static func primaryKey() -> String? {
        return "symbol"
    }
}
