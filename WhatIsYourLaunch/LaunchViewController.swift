//
//  LaunchViewController.swift
//  WhatIsYourLaunch
//
//  Created by Alan Yen on 2016/4/13.
//  Copyright © 2016年 Alan.Yen. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel?
    var lauchMnager: ALLauch?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        if motion == .MotionShake {
            infoLabel?.text = "今天吃: " + (lauchMnager?.ramdonLaunch())!
        }
    }
}