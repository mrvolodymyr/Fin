//
//  NewCategoryVC.swift
//  WhereIsMyMoney
//
//  Created by Volodymyr on 10/6/17.
//  Copyright © 2017 Volodymyr. All rights reserved.
//

import UIKit

class NewCategoryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var newCategoryTextField: UITextField!
    
    @IBOutlet weak var selectedImage: UIImageView!
    var imageName: String = ""
    var storeData = DataStore.dataStore
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New category"
    }
    
    var dataModel = DataMolel.dataMolel
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataModel.categoryImgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CrCatCell", for: indexPath) as! CrCatCollectionViewCell
        cell.crCatImg.image	= UIImage(named: dataModel.categoryImgArr[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedImage.image = UIImage(named: dataModel.categoryImgArr[indexPath.row])
        imageName = dataModel.categoryImgArr[indexPath.row]
    }
    
    @IBAction func createCategoryButton(_ sender: Any) {
        if !(newCategoryTextField.text?.isEmpty)! && !(imageName.isEmpty) {
            dataModel.addToCategoryes(categoryName: newCategoryTextField.text!, categoryImg: imageName)
            navigationController?.popViewController(animated: true)
        } else {
            let alert = UIAlertController(title: "Please", message: "Enter category name and select category image ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK: - save data
    var filePath: String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        return url!.appendingPathComponent("Categoryes").path
    }
    
    private func saveData(category: CategoryModel){
        self.dataModel.categoryes.append(category)
        NSKeyedArchiver.archiveRootObject(self.storeData.categoryes, toFile: filePath)
    }
    
    func saveCategory() {
        let categoryName = newCategoryTextField.text!
        let categoryImage = imageName
        let newCategory = CategoryModel(categoryName: categoryName, categoryImg: categoryImage)
        self.saveData(category: newCategory)
    }
    
    @IBAction func saveCategoryButton(_ sender: Any) {
        saveCategory()
        let alert = UIAlertController(title: "Save category", message: "Category was saved", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            self.selectedImage.image = nil
            self.newCategoryTextField.text = ""
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
