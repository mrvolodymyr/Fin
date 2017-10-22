//
//  CategoryVC.swift
//  WhereIsMyMoney
//
//  Created by Volodymyr on 10/6/17.
//  Copyright © 2017 Volodymyr. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var transactionSumTextField: UITextField!
    @IBOutlet weak var transactionDescrTextField: UITextField!
    @IBOutlet weak var transactionStatus: UISegmentedControl!
    @IBOutlet weak var selectedCategoryImg: UIImageView!
    @IBOutlet weak var selectedCategoryLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var createTransactionButton: UIButton!
    
    var dataModel = DataMolel.dataMolel
    var status: Bool = false
    var selectedImageName: String = ""
    var categoryName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New transaction"
        selectedCategoryLabel.text = ""
        editing()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.collectionView.reloadData()
    }
    
    fileprivate func editing (){
        if myIndexPathRow != nil {
            let index = dataModel.transactions[myIndexPathRow!]
            transactionSumTextField.text = String(index.transactionSum)
            transactionDescrTextField.text = index.transactionDescr
            selectedCategoryImg.image = UIImage(named: index.transactionImg)
            selectedCategoryLabel.text = index.categoryName
            createTransactionButton.setTitle("Save category", for: .normal)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataModel.categoryes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "catCell", for: indexPath) as! NewTransCollectionViewCell
        cell.categoryImage.image = UIImage(named: dataModel.categoryes[indexPath.row].categoryImg)
        cell.categoryLabel.text = dataModel.categoryes[indexPath.row].categoryName
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedImageName = dataModel.categoryes[indexPath.row].categoryImg
        categoryName = dataModel.categoryes[indexPath.row].categoryName
        selectedCategoryImg.image = UIImage(named: selectedImageName)
        selectedCategoryLabel.text = categoryName
    }
    
    @IBAction func createNewCategoryButton(_ sender: Any) {
        guard let newCategoryViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewCategoryViewController") as? NewCategoryViewController else {
            
            return
        }
        navigationController?.pushViewController(newCategoryViewController, animated: true)
    }
    
    @IBAction func transactionstatus(_ sender: Any) {
        status = transactionStatus.selectedSegmentIndex == 0 ? false : true
    }
    
    @IBAction func crateTransactionButton(_ sender: Any) {
        if !(transactionSumTextField.text?.isEmpty)! && !(selectedImageName.isEmpty)  {
            let transactionDescr = transactionDescrTextField.text!
            var transactionSum = Double(transactionSumTextField.text!)!
            if status == false { transactionSum *= (-1) }
            dataModel.addToTransactions(transactionImg: selectedImageName, categoryName: categoryName, transactionDescr: transactionDescr, transactionSum: transactionSum, transactionStatus: status)
            
            self.navigationController?.popViewController(animated: true)
        } else {
            let alert = UIAlertController(title: "Please", message: "Enter sum and select category image ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }

        
        
        
    }

    
}
