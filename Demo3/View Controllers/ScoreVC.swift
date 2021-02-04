//
//  ScoreVC.swift
//  Demo3
//
//  Created by PCQ196 on 04/02/21.
//

import UIKit

class ScoreVC: UIViewController {
    
    @IBOutlet weak var vwHeader: UIView!
    @IBOutlet weak var tblvwScore: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tblvwScore.register(UINib(nibName: "ScoreTblCell", bundle: .main), forCellReuseIdentifier: "ScoreTblCell")
    }

}

// MARK: score tableview configurations
extension ScoreVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPlayers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreTblCell", for: indexPath) as! ScoreTblCell
        let player = arrPlayers[indexPath.row]
        cell.lblIndex.text = "\(indexPath.row + 1)"
        if let name = player["name"] as? String{
            cell.lblName.text = name
        }
        if let score = player["score"] as? Int{
            cell.lblScore.text = "\(score)"
        }
        if let img = player["image"] as? UIImage{
            cell.imgvwPlayerImg.image = img
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = Util.getStoryboard().instantiateViewController(withIdentifier: "PlayerDetailVC") as! PlayerDetailVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
