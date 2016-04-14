//
//  ALLauch.swift
//  WhatIsYourLaunch
//
//  Created by Alan Yen on 2016/4/13.
//  Copyright © 2016年 Alan.Yen. All rights reserved.
//

import UIKit

class ALLauch: NSObject {
    
    var lauchArray: [String] = []
    var maxLaucn: Int
    
    init(max: Int) {
        
        maxLaucn = max
    }
    
    func addLauch(launchName: String) -> Bool {
        
        if (lauchArray.count < maxLaucn) {
            lauchArray.append(launchName);
            return true
        }
        return false
    }
    
    func ramdonLaunch() -> String {
        
        var rnNumber = Int(arc4random_uniform(UInt32(maxLaucn)))
        rnNumber = (rnNumber % lauchArray.count)
        let launchName: String = lauchArray[rnNumber]
        return launchName
    }
}
