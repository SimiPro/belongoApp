//
//  LoginViewController.swift
//  itrip
//
//  Created by Simon Huber on 13/02/15.
//  Copyright (c) 2015 itrip. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func SignIn(sender: UIButton) {
        var username:NSString = txtUsername.text
        var password:NSString = txtPassword.text
        
        if ( username.isEqualToString("") || password.isEqualToString("")) {
            self.checkToken()
        } else {
            var result  = Alamofire.request(LoginRequest.Login(username: "user", password: "password"))
                .responseObject({ (_,_,token:TokenSerializer?, _) in
                    if (token?.token != nil) {
                        Token.setToken(token!.token!)
                        Token.setRefreshToken(token!.refresh_token!)
                    }
                    if (Token.isAuthenticated()) {
                        var storyboard = UIStoryboard(name: "Belongo", bundle: nil)
                        var controller = storyboard.instantiateViewControllerWithIdentifier("InitialController") as UIViewController
        
                        self.presentViewController(controller, animated: true, completion: nil)
                        //self.dismissViewControllerAnimated(true, nil)
                    }
                })
            }
        }
        
        
        

     //   var request =  Manager.sharedInstance.request(Router.Login(query: "test"))
//        Manager.sharedInstance.request(Router.Login(query: ["username":"username", "password":"password"]))
    

    
    
    func checkToken()  {
        if (Token.isAuthenticated()) {
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign in Failed!"
            alertView.message = "Check Username and Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()

        }

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
