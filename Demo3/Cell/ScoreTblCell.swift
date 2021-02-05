//
//  ScoreTblCell.swift
//  Demo3
//
//  Created by PCQ196 on 04/02/21.
//

import UIKit

class ScoreTblCell: UITableViewCell {
    
    @IBOutlet weak var lblIndex :UILabel!
    @IBOutlet weak var lblName :UILabel!
    @IBOutlet weak var lblScore :UILabel!
    @IBOutlet weak var imgvwPlayerImg :UIImageView!
    
    var playerId: Int? = Int()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
