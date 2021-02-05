//
//  PlayVC.swift
//  Demo3
//
//  Created by PCQ196 on 04/02/21.
//

import UIKit

class PlayVC: UIViewController {
    
    @IBOutlet weak var vwHeader: UIView!
    @IBOutlet weak var collvwBoard: UICollectionView!
    
    var prevNum = Int()
    var currentNum = Int()
    var selectedCount = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set collectionview frame
        collvwBoard.frame = CGRect(x: 10, y: 150, width: screenWidth - 20, height: screenWidth - 20)
    }

}

// MARK: Collectionview configurations
extension PlayVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 49
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayCollCell", for: indexPath) as! PlayCollCell
        cell.backgroundColor = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
        cell.lblNum.text = "\(indexPath.row + 1)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.frame.size.width - 60) / 7
        let height = (collectionView.frame.size.height - 60) / 7
        return CGSize(width: width, height: height)
    }
    
    // action on selecting cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCell = collectionView.cellForItem(at: indexPath) as! PlayCollCell
        selectedCell.backgroundColor = .red
        
        if selectedCount == 1{
            
            currentNum = indexPath.row + 1
            if (prevNum % 2 == 0) && (currentNum % 2 == 0) {
            
                let done = UIAlertAction(title: "OK", style: .default, handler: { (_ action) in
                    self.selectedCount = 0
                    self.prevNum = 0
                    self.currentNum = 0
                    self.collvwBoard.reloadData()
                })
                Alert.shared.ShowAlert(title: "Both are Even numbers", message: "", in: self, withAction: [done], addCloseAction: false)
                
            } else if (prevNum % 2 == 1) && (currentNum % 2 == 1) {
                
                let done = UIAlertAction(title: "OK", style: .default, handler: { (_ action) in
                    self.selectedCount = 0
                    self.prevNum = 0
                    self.currentNum = 0
                    self.collvwBoard.reloadData()
                })
                Alert.shared.ShowAlert(title: "Both are Odd numbers", message: "", in: self, withAction: [done], addCloseAction: false)
                
            } else {
                
                collvwBoard.isUserInteractionEnabled = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.selectedCount = 0
                    self.prevNum = 0
                    self.currentNum = 0
                    self.collvwBoard.reloadData()
                    self.collvwBoard.isUserInteractionEnabled = true
                }
                
            }
            
        } else if selectedCount == 0 {
            
            prevNum = indexPath.row + 1
            selectedCount += 1
            
        }
        
    }
}
