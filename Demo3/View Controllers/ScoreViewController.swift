//
//  ScoreVC.swift
//  Demo3
//
//  Created by PCQ196 on 04/02/21.
//

import UIKit

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var vwHeader: UIView!
    @IBOutlet weak var tblvwScore: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register tableview cell from nib
        tblvwScore.register(UINib(nibName: K.scoreCellNibName, bundle: .main), forCellReuseIdentifier: K.scoreCellIdentifire)
    }

}

// MARK: score tableview configurations
extension ScoreViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPlayers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.scoreCellIdentifire, for: indexPath) as! ScoreTblCell
        let player = arrPlayers[indexPath.row]
        
        cell.lblIndex.text = "\(indexPath.row + 1)"
        if let id = player["id"] as? Int{
            cell.playerId = id
        }
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
    
    // on selecting cell of table
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath) as! ScoreTblCell
        let vc = Util.getStoryboard().instantiateViewController(withIdentifier: K.playerDetailVCIdentifire) as! PlayerDetailViewController
        vc.playerId = selectedCell.playerId
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
