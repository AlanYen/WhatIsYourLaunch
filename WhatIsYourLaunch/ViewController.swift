//
//  ViewController.swift
//  WhatIsYourLaunch
//
//  Created by Alan Yen on 2016/4/13.
//  Copyright © 2016年 Alan.Yen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputTextField: UITextField?
    @IBOutlet weak var confirmButton: UIButton?
    let lauchMnager = ALLauch(max: 5)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onConfirmButtonPressed(sender: UIButton) {
        
        let text: String! = inputTextField?.text
        if (text.isEmpty) {
            showAlert("請輸入午餐名稱")
        }
        else {
            let result: Bool = lauchMnager.addLauch(text)
            if (!result) {
                showAlert("新增午餐失敗(已達最大值)")
            }
            else {
                self.performSegueWithIdentifier("NextPage",
                                                sender: self)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "NextPage") {
            
            if let viewController: LaunchViewController = segue.destinationViewController as? LaunchViewController {
                viewController.lauchMnager = self.lauchMnager
            }
        }
    }
    
    func showAlert(message: String) {
        
        let alertController =
            UIAlertController(title: "Lauch",
                              message: message,
                              preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(
            UIAlertAction(title: "確定",
                style: UIAlertActionStyle.Default,
                handler: { (actionSheetController) -> Void in
                    alertController.dismissViewControllerAnimated(true, completion:nil)
            }))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}

