//
//  ViewController.swift
//  Demo3
//
//  Created by PCQ196 on 04/02/21.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var btnStart: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func userHandle(_ sender: UIButton){
        
        if sender == btnStart{
            
            let vc = Util.getStoryboard().instantiateViewController(withIdentifier: K.tabbarIdentifier) as! TabbarViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}

