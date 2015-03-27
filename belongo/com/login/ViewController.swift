//
//  ViewController.swift
//  itrip
//
//  Created by Simon Huber on 13/02/15.
//  Copyright (c) 2015 itrip. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var lblUsername: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        if (Token.isAuthenticated()) {
            self.lblUsername.text = "NO USERNAME"
        } else {
            self.performSegueWithIdentifier("goto_login", sender: self)
        }
        
    }
    
    @IBAction func btnLogout(sender: UIButton) {
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
        self.performSegueWithIdentifier("goto_login",sender:self)
    }


}

