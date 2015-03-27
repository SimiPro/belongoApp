//
//  UINavigationViewController.swift
//  belongo
//
//  Created by Simon Huber on 06/03/15.
//  Copyright (c) 2015 itrip. All rights reserved.
//

import Foundation

class UINavigationViewController : UIViewController {
    @IBOutlet weak var menuButton:UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customSetup()
        
        // Do any additional setup after loading the view.
    }
    
    func customSetup() {
        menuButton.target = self.revealViewController()
        menuButton.action = "revealToggle:"
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    override func applicationFinishedRestoringState() {
        println("App restored")
        customSetup()
    }

}

class UITableNavigationViewController: UITableViewController {
    @IBOutlet weak var menuButton:UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customSetup()
        
        // Do any additional setup after loading the view.
    }
    
    func customSetup() {
        menuButton.target = self.revealViewController()
        menuButton.action = "revealToggle:"
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    override func applicationFinishedRestoringState() {
        println("App restored")
        customSetup()
    }

}