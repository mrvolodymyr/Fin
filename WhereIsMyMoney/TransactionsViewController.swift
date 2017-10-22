//
//  TransactionsVC.swift
//  WhereIsMyMoney
//
//  Created by Volodymyr on 10/8/17.
//  Copyright © 2017 Volodymyr. All rights reserved.
//

import UIKit

class TransactionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var totalSum: UILabel!
    @IBOutlet weak var transactionTableView: UITableView!


    var dataModel = DataMolel.dataMolel
    
    var redColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.25)
    var greenColor = UIColor(red: 0, green: 255, blue: 0, alpha: 0.25)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Transactions"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.transactionTableView.reloadData()
        getTotalSum()
    }

    fileprivate func getTotalSum() {
        let array = dataModel.transactions
        var total = dataModel.totalSum
        for i in array { total += i.transactionSum }
        totalSum.text = String(total)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath) as! TransactionTableViewCell
        let transaction = dataModel.transactions[indexPath.row]
        cell.transactionImg.image = UIImage(named: dataModel.transactions[indexPath.row].transactionImg)
        cell.categoryNameLabel.text = transaction.categoryName
        cell.transactionNameLabel.text = transaction.transactionDescr
        cell.sumLabel.text = String(transaction.transactionSum)
        cell.backgroundColor = transaction.transactionStatus == true ?
            greenColor : redColor

        return cell
    }

    @IBAction func addCategoryViewControllerButton(_ sender: Any) {
        guard let categoryViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CategoryViewController") as? CategoryViewController else { return }
        self.navigationController?.pushViewController(categoryViewController, animated: true)
    }
  
    @IBAction func statisticButtonTapped(_ sender: Any) {
        guard let statisticViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StatisticViewController") as? StatisticViewController else { return }
        self.navigationController?.pushViewController(statisticViewController, animated: true)
    }
    
}
