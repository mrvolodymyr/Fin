//
//  CategoryVC.swift
//  WhereIsMyMoney
//
//  Created by Volodymyr on 10/6/17.
//  Copyright © 2017 Volodymyr. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var transactionSumTextField: UITextField!
    @IBOutlet weak var transactionDescrTextField: UITextField!
    @IBOutlet weak var transactionStatus: UISegmentedControl!
    @IBOutlet weak var selectedCategoryImg: UIImageView!
    @IBOutlet weak var selectedCategoryLabel: UILabel!
    
    var status: Bool = false
    var imageName: String = ""
    var categoryName: String = ""
    var dataModel = DataMolel.dataMolel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New transaction"
        selectedCategoryLabel.text = ""
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
        imageName = dataModel.categoryes[indexPath.row].categoryImg
        categoryName = dataModel.categoryes[indexPath.row].categoryName
        
        selectedCategoryImg.image = UIImage(named: imageName)
        selectedCategoryLabel.text = categoryName
    }
    
    @IBAction func createNewCategoryButton(_ sender: Any) {
        guard let newCategoryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewCategoryVC") as? NewCategoryVC else{
            return
        }
        navigationController?.pushViewController(newCategoryVC, animated: true)
    }
    
    @IBAction func transactionstatus(_ sender: Any) {
        status = transactionStatus.selectedSegmentIndex == 0 ? false : true
    }
    
    @IBAction func crateTransactionButton(_ sender: Any) {
        self.performSegue(withIdentifier: "createTransactionSegue", sender: self)
    }
    
    override func prepare(for createTransactionSegue: UIStoryboardSegue, sender: Any?) {
        dataModel.addToTransactions(transactionImg: imageName, transactionDescr: transactionDescrTextField.text!, transactionSum: Double(transactionSumTextField.text!)!, transactionStatus: status)
    }
    
}