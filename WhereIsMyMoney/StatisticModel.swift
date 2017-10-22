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
    var spentMoney: Double
    
    init (categoryName : String, categoryImg: String, spentMoney: Double){
        self.categoryName = categoryName
        self.categoryImg = categoryImg
        self.spentMoney = spentMoney
    }
    
}

