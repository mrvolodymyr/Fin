//
//  StatisticViewController.swift
//  WhereIsMyMoney
//
//  Created by Volodymyr on 10/21/17.
//  Copyright © 2017 Volodymyr. All rights reserved.
//

import UIKit

class StatisticViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let statisticData = DataMolel.dataMolel
    var spentArray = [CategoryModel]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        sort()
    }
    
//    func sortForReport(/*transactions: [statisticData.transactions], categoryes: [statisticData.categoryes]*/) -> [SpendingByCategory] {
//        var spent = [SpendingByCategory]()
//        var transaction = statisticData.transactions
//        var categrory = statisticData.categoryes
//
//        var sorted = transaction.sorted( by: { $0.categoryName == $1.categoryName } )
//
//
//        return spent
//    }
    
//    func filterArray(array: [String], f: (_ secondArray: [String]) -> Bool) -> [SpendingByCategory]{
//        var filtered = [SpendingByCategory]()
//
//        for i in array {
//            if f(i.categoryName) {
//                filtered.append(i.categoryName)
//            }
//            print("********************")
//            print(i)
//        }
//        return filtered
//    }
    
    fileprivate func sort() {
      
        let transaction = statisticData.transactions
        let category = statisticData.categoryes

        var categoryDictionary = [String: Bool]()
        for value in transaction { categoryDictionary[value.categoryName] = true }
        
        let sorted = category.filter { value in categoryDictionary[value.categoryName] != nil }
        spentArray = sorted
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return spentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statisticCell", for: indexPath) as! StatisticTableViewCell
        let spent = spentArray[indexPath.row]
        cell.categoryNameLabel.text = spent.categoryName
        cell.categoryImage.image = UIImage(named: spent.categoryImg)
        return cell
    }
    
}



