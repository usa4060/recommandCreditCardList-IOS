//
//  CradListCell.swift
//  RecommandCreditCardList
//
//  Created by admin on 2022/03/06.
//

import UIKit

class CradListCell: UITableViewCell {

    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var randLabel: UILabel!
    @IBOutlet weak var promotionLabel: UILabel!
    @IBOutlet weak var cardNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
