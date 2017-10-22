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
    var totalSum = 0.0
        
    var categoryImgArr = ["img_1.jpg", "img_2.jpg", "img_3.jpg", "img_4.jpg", "img_5.jpg", "img_6.jpg", "img_7.jpg", "img_8.jpg", "img_9.jpg", "img_10.jpg", "img_11.jpg", "img_12.jpg", "img_13.jpg", "img_14.jpg", "img_15.jpg", "img_16.jpg"]
    
    var redColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.2)
    var greenColor = UIColor(red: 0, green: 255, blue: 0, alpha: 0.2)
    
    func addToCategoryes(categoryName: String, categoryImg: String){
        let newCategory = CategoryModel(categoryName: categoryName, categoryImg: categoryImg)
        categoryes.append(newCategory)
    }
    
    func addToTransactions(transactionImg: String, categoryName: String, transactionDescr: String, transactionSum: Double, transactionStatus: Bool){
        let newTransaction = TransactionsModel(transactionImg: transactionImg, categoryName: categoryName, transactionDescr: transactionDescr, transactionSum: transactionSum, transactionStatus: transactionStatus)
    transactions.insert(newTransaction, at: 0)
    }
}
