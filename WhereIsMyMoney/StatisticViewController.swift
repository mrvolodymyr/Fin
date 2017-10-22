//
//  StatisticViewController.swift
//  WhereIsMyMoney
//
//  Created by Volodymyr on 10/21/17.
//  Copyright © 2017 Volodymyr. All rights reserved.
//

import UIKit
import PieCharts

class StatisticViewController: UIViewController {

    let statisticData = DataMolel.dataMolel
    
    @IBOutlet var charView: PieChart!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func sortForReport(transactions: [statisticData.transactions], categoryes: [statisticData.categoryes]) -> [SpendingByCategory] {
        for operation in statisticData.transactions {
            
        }
        
    }
    

}
