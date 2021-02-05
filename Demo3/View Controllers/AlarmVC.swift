//
//  AlarmVC.swift
//  Demo3
//
//  Created by PCQ196 on 04/02/21.
//

import UIKit

class AlarmVC: UIViewController {

    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var btnStartStop: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    
    var isLive = false
    var timer = Timer()
    
    var time = Int()
    var mins = Int()
    var sec = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        time = 5
        updateTimeLbl()
       
    }
    
    @objc func updateTime(){
    
        time = time - 1
        
        if time < 0{
            timer.invalidate()
            isLive = false
            btnStartStop.setTitle("START", for: .normal)
            print("Finished")
        } else {
            updateTimeLbl()
        }
        
    }
    func updateTimeLbl(){
        
        mins = Int(time / 60)
        sec = time % 60
        
        lblTime.text = "\(String(format: "%02d", mins)) : \(String(format: "%02d", sec))"
    }
    

    @IBAction func userHandle(_ sender: UIButton){
        
        if sender == btnStartStop{
            
            if isLive {
                timer.invalidate()
                btnStartStop.setTitle("START", for: .normal)
                isLive = false
            } else if isLive == false && time > 0 {
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
                btnStartStop.setTitle("STOP", for: .normal)
                isLive = true
            }
            
        } else if sender == btnAdd{
            
           
        }

    }
    
}

