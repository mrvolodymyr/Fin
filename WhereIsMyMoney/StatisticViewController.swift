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
    let dataModel = DataMolel.dataMolel
    
    @IBOutlet weak var sortedCategoryTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sort()
    }

    override func viewDidAppear(_ animated: Bool) {
        self.sortedCategoryTableView.reloadData()
    }
    
    //MARK: - function sort
    fileprivate func sort() {
        let transaction = statisticData.transactions
        let category = statisticData.categoryes
        var categoryDictionary = [String: Bool]()
        for item in transaction { categoryDictionary[item.categoryName] = true }
        spentArray = category.filter { item in categoryDictionary[item.categoryName] != nil }

    }
    
    //MARK: - get category name from transaction array
    fileprivate func getCategoryTotalSum(key: String) -> Double {
        let transaction = statisticData.transactions
        var sum = 0.0
        for i in 0...transaction.count - 1 {
            if transaction[i].categoryName == key {
            sum += transaction[i].transactionSum
            }
        }
        return sum
    }
    
    //MARK: - create reusable cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statisticCell", for: indexPath) as! StatisticTableViewCell
        let spent = spentArray[indexPath.row]
        let sum = getCategoryTotalSum(key: spent.categoryName)
        cell.categoryNameLabel.text = spent.categoryName
        cell.totalSumLabel.text = String(sum)
        sum > 0.0 ? (cell.backgroundColor  = dataModel.greenColor) : (cell.backgroundColor = dataModel.redColor)
        cell.categoryImage.image = UIImage(named: spent.categoryImg)
        
        return cell
    }

}



