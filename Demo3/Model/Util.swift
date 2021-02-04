//
//  Util.swift
//  Demo3
//
//  Created by PCQ196 on 04/02/21.
//

import Foundation
import  UIKit

class Util: NSObject {
    
    private override init() {}

    // shared instance of Util.
    static let sharedInstance: Util = Util()

    // to get particular storyboard name.
    class func getStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
   
    // to print log in to console.
    class func printLog( _ details : Any = "", _ title : String = "") {
        print("\(title) : \(details)")
    }
}
