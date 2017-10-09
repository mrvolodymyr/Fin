//
//  NewCategoryVC.swift
//  WhereIsMyMoney
//
//  Created by Volodymyr on 10/6/17.
//  Copyright © 2017 Volodymyr. All rights reserved.
//

import UIKit

class NewCategoryVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var newCategoryTextField: UITextField!
    
    @IBOutlet weak var selectedImage: UIImageView!
    var imgName: String = ""
    
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
        imgName = dataModel.categoryImgArr[indexPath.row]
    }

    override func prepare(for categorySegue: UIStoryboardSegue, sender: Any?) {
        dataModel.addToCategoryes(categoryName: newCategoryTextField.text!, categoryImg:  imgName)
    }
    
    @IBAction func createCategoryButton(_ sender: Any) {
        performSegue(withIdentifier: "categorySegue", sender: self)
    }
}
