//
//  TransactionsVC.swift
//  WhereIsMyMoney
//
//  Created by Volodymyr on 10/8/17.
//  Copyright © 2017 Volodymyr. All rights reserved.
//

import UIKit

class TransactionsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var dataModel = DataMolel.dataMolel
    var redColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.25)
    var greenColor = UIColor(red: 0, green: 255, blue: 0, alpha: 0.25)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Transactions"
    }

    @IBAction func createTransactionButton(_ sender: Any) {
        performSegue(withIdentifier: "transactionSegue", sender: self)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath) as! TransactionTableViewCell
        cell.transactionImg.image = UIImage(named: dataModel.transactions[indexPath.row].transactionImg)
        cell.transactionNameLabel.text = dataModel.transactions[indexPath.row].transactionDescr
        cell.sumLabel.text = String(dataModel.transactions[indexPath.row].transactionSum)
        cell.backgroundColor = dataModel.transactions[indexPath.row].transactionStatus == true ?
            greenColor : redColor
        return cell
    }

}
