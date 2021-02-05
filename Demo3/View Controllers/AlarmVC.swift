//
//  AlarmVC.swift
//  Demo3
//
//  Created by PCQ196 on 04/02/21.
//

import UIKit

class AlarmVC: UIViewController {

    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    var alertWithTF = UIAlertController()
    var timer = Timer()
    
    var time : Int = 0
    var mins = Int()
    var sec = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        time = 0
        updateTimeLbl()
        configureAlertWithTF()
    }
    
    // to update(decrease) time
    @objc func updateTime(){
        
        time = time - 1
        if time <= 0{
            timer.invalidate()
            print("Finished")
            if time < 0{
                return
            }
        }
        updateTimeLbl()
        
    }
    
    // to update timer label
    func updateTimeLbl(){
        
        mins = Int(time / 60)
        sec = time % 60
        lblTime.text = "\(String(format: "%02d", mins)) : \(String(format: "%02d", sec))"
    }
    
    // to configure alertview with text fields
    func configureAlertWithTF(){
        
        alertWithTF = UIAlertController(title: "Enter Minutes and Seconds", message: "", preferredStyle: .alert)
        
        let done = UIAlertAction(title: "Done", style: .default) { (_ action) in
            
            let txtMinutes = self.alertWithTF.textFields![0] as UITextField
            let txtSeconds = self.alertWithTF.textFields![1] as UITextField
            
            let minutes = Int(txtMinutes.text ?? "0") ?? 0
            let seconds = Int(txtSeconds.text ?? "0") ?? 0
            
            self.timer.invalidate()
            self.time = (minutes * 60) + seconds
            self.updateTimeLbl()
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
            
        }
        
        alertWithTF.addTextField { (textField) in
            textField.placeholder = "Minutes"
            textField.keyboardType = .numberPad
        }
        alertWithTF.addTextField { (textField) in
            textField.placeholder = "Seconds"
            textField.keyboardType = .numberPad
        }
        alertWithTF.addAction(done)
        alertWithTF.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        
    }
    
    // user interaction function with buttons
    @IBAction func userHandle(_ sender: UIButton){
        
        if sender == btnReset{
            
            timer.invalidate()
            time = 0
            self.updateTimeLbl()
            
        } else if sender == btnAdd{
            
            self.present(alertWithTF, animated: true, completion: nil)
            
        }

    }
    
}

