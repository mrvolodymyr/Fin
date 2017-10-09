//
//  CategoryModel.swift
//  WhereIsMyMoney
//
//  Created by Volodymyr on 10/6/17.
//  Copyright © 2017 Volodymyr. All rights reserved.
//

import UIKit

class CategoryModel: NSObject {
    
    var categoryName: String
    var categoryImg: String
    
    init(categoryName: String, categoryImg: String) {
        self.categoryName = categoryName
        self.categoryImg = categoryImg
        
        super.init()
    }
    
    
}
