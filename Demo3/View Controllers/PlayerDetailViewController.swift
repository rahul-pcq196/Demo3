//
//  PlayerDetailVC.swift
//  Demo3
//
//  Created by PCQ196 on 04/02/21.
//

import UIKit

class PlayerDetailViewController: UIViewController {

    @IBOutlet weak var vwHeader: UIView!
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var imgPlayer : UIImageView!
    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var lblScore : UILabel!
    @IBOutlet weak var lblCountry : UILabel!
    @IBOutlet weak var txtvwAbout : UITextView!
    
    var playerId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // fatch and set detail of player
        let filteredArray = arrPlayers.filter { $0["id"] as? Int == playerId }
        if filteredArray.count > 0{
            let player = filteredArray[0]
            
            if let name = player["name"] as? String{
                self.lblName.text = name
            }
            if let score = player["score"] as? Int{
                self.lblScore.text = "\(score)"
            }
            if let image = player["image"] as? UIImage{
                self.imgPlayer.image = image
            }
            if let country = player["country"] as? String{
                self.lblCountry.text = country
            }
        }
    }
    
    @IBAction func userHandle(_ sender: UIButton){
        if sender == btnBack{
            self.navigationController?.popViewController(animated: true)
        }
    }

}
