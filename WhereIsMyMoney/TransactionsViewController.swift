//
//  TransactionsVC.swift
//  WhereIsMyMoney
//
//  Created by Volodymyr on 10/8/17.
//  Copyright © 2017 Volodymyr. All rights reserved.
//

import UIKit

var myIndexPathRow: Int? = nil

class TransactionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var totalSum: UILabel!
    @IBOutlet weak var transactionTableView: UITableView!

    var dataModel = DataMolel.dataMolel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Transactions"
        self.transactionTableView.dataSource = self
        self.transactionTableView.delegate = self
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
    
    //MARK: - create reusable cell
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
            dataModel.greenColor : dataModel.redColor
        return cell
    }
    
    fileprivate func pushCategoryViewController(row: Int?){
        guard let categoryViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CategoryViewController") as? CategoryViewController else { return }
        self.navigationController?.pushViewController(categoryViewController, animated: true)
        myIndexPathRow = row
    }
    
    //MARK: - delede transaction
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "WARNING", message: "Do you want to delete this transaction?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "YES", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            self.dataModel.transactions.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
            self.transactionTableView.reloadData()
            self.getTotalSum()
        }))
        alert.addAction(UIAlertAction(title: "NO", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func addCategoryViewControllerButton(_ sender: Any) {
        pushCategoryViewController(row: nil)
    }
  
    //MARK: - statistic button
    @IBAction func statisticButtonTapped(_ sender: Any) {
        guard let statisticViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StatisticViewController") as? StatisticViewController else { return }
        self.navigationController?.pushViewController(statisticViewController, animated: true)
    }
    
}
