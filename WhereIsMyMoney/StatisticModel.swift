//
//  SpendigModel.swift
//  WhereIsMyMoney
//
//  Created by Volodymyr on 10/21/17.
//  Copyright © 2017 Volodymyr. All rights reserved.
//

import UIKit

class SpendingByCategory: NSObject {
    var categoryName: String
    var categoryImg: String
    var spendMoney: Double
    var color: UIColor
    
    init (categoryName : String, categoryImg: String, spendMoney: Double, color: UIColor){
        self.categoryName = categoryName
        self.categoryImg = categoryImg
        self.spendMoney = spendMoney
        self.color = color
    }
    
}

