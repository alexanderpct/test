//
//  Stock.swift
//  Stonks
//
//  Created by Alexander on 30.08.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation


struct Stock: Decodable {
    var symbol: String
    var companyName: String
    var latestPrice: Double
    var change: Double
}
