//
//  StatisticTableViewCell.swift
//  WhereIsMyMoney
//
//  Created by Volodymyr on 10/22/17.
//  Copyright © 2017 Volodymyr. All rights reserved.
//

import UIKit

class StatisticTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var totalSumLabel: UILabel!
    @IBOutlet weak var persentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
