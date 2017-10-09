//
//  DataMolel.swift
//  WhereIsMyMoney
//
//  Created by Volodymyr on 10/8/17.
//  Copyright © 2017 Volodymyr. All rights reserved.
//

import UIKit

class DataMolel: NSObject {

    static let dataMolel = DataMolel()
    
    var categoryes: [CategoryModel] = []
    var transactions: [TransactionsModel] = []
    
//    var imgArr = ["img_1.jpg", "img_2.jpg", "img_3.jpg", "img_4.jpg", "img_5.jpg", "img_6.jpg", "img_7.jpg"]
//    
//    var categoryArray = ["Home", "Food", "Transport",  "Work", "Kids", "Shopping", "Mobile"]
    
    var categoryImgArr = ["img_1.jpg", "img_2.jpg", "img_3.jpg", "img_4.jpg", "img_5.jpg", "img_6.jpg", "img_7.jpg", "img_8.jpg", "img_9.jpg", "img_10.jpg", "img_11.jpg", "img_12.jpg", "img_13.jpg", "img_14.jpg", "img_15.jpg", "img_16.jpg"]
    
    
    func addToCategoryes(categoryName: String, categoryImg: String){
        let newCategory = CategoryModel(categoryName: categoryName, categoryImg: categoryImg)
        categoryes.append(newCategory)
    }
    
    func addToTransactions(transactionImg: String, transactionDescr: String, transactionSum: Double, transactionStatus: Bool){
        let newTransaction = TransactionsModel(transactionImg: transactionImg, transactionDescr: transactionDescr, transactionSum: transactionSum, transactionStatus: transactionStatus)
    transactions.insert(newTransaction, at: 0)
    }
}