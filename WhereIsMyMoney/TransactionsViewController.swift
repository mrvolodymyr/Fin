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
    var total = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Transactions"
        getTotalSum()
    }

    fileprivate func getTotalSum() {
        let array = dataModel.transactions
        for i in array{
        total += i.transactionSum
        }
        totalSum.text = String(total)
    }
    
    @IBAction func createTransactionButton(_ sender: Any) {
        performSegue(withIdentifier: "transactionSegue", sender: self)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath) as! TransactionTableViewCell
        let transaction = dataModel.transactions[indexPath.row]
        
        cell.transactionImg.image = UIImage(named: dataModel.transactions[indexPath.row].transactionImg)
        cell.transactionNameLabel.text = transaction.transactionDescr
        cell.sumLabel.text = String(transaction.transactionSum)
        cell.backgroundColor = transaction.transactionStatus == true ?
            greenColor : redColor

        return cell
    }

  
    @IBAction func statisticButtonTapped(_ sender: Any) {
        guard let statisticViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StatisticViewController") as? StatisticViewController else { return }
        self.navigationController?.pushViewController(statisticViewController, animated: true)
    }
    
}
