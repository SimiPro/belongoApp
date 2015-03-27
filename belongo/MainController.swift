//
//  MainController.swift
//  belongo
//
//  Created by Simon Huber on 27/03/15.
//  Copyright (c) 2015 itrip. All rights reserved.
//

import Foundation

class MainController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func main(sender: AnyObject) {
            var storyboard = UIStoryboard(name: "Belongo", bundle: nil)
            var controller = storyboard.instantiateViewControllerWithIdentifier("InitialController") as UIViewController
            
            self.presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func popLogin(sender: AnyObject) {
        var storyboard = UIStoryboard(name: "Login", bundle: nil)
        var controller = storyboard.instantiateViewControllerWithIdentifier("InitialController") as UIViewController
        
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
}