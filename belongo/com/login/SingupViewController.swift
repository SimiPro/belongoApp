//
//  SingupViewController.swift
//  itrip
//
//  Created by Simon Huber on 13/02/15.
//  Copyright (c) 2015 itrip. All rights reserved.
//



import UIKit




class SingupViewController: UIViewController {

    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func btnSignup(sender: UIButton) {
        
        
        var username:NSString = txtUsername.text as NSString
        var password:NSString = txtPassword.text as NSString
        var confirm_password:NSString = txtConfirmPassword.text as NSString
        
        if (username.isEqualToString("") || password.isEqualToString("")) {
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign Up Failed!"
            alertView.message = "Please enter Username and Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        } else if (!password.isEqual(confirm_password)) {
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign Up failed!"
            alertView.message = "Passwords doesn't match"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        } else  {
            /*
            let adi:LBRESTAdapter = Adapter.globals.adapter
            let repo = adi.repositoryWithClass(LBUserRepository) as LBUserRepository

            let usr = repo.createUserWithEmail(username, password: password)
            usr.saveWithSuccess({ () -> Void in
                println("Success")
                }, failure: { (err:NSError!) -> Void in
                println(err)
            })

            
                */
            
            /*let usr:User = User(firstName: username, lastName: username, email: username, password: password)
            usr.save()
            */
            /*
            var post:NSString = "username=\(username)&password=\(password)&c_password\(confirm_password)"
            NSLog("Post Data: %@", post)
            var url:NSURL = NSURL(string: "https://itrip.com/signup.php")!
            var postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!
            var postLength:NSString = String(postData.length)
            var request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            request.HTTPBody = postData
            request.setValue(postLength, forHTTPHeaderField: "Content-Length")
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        
            var responseError: NSError?
            var response: NSURLResponse?
        
            var urlData: NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: &responseError)
            
            if (urlData != nil) {
                let res = response as NSHTTPURLResponse!
                NSLog("Response code: %@", res.statusCode)
                if (res.statusCode >= 200 && res.statusCode < 300) {
                    var responseData:NSString = NSString(data:urlData!,encoding:NSUTF8StringEncoding)!
                    NSLog("Response ==> %@", responseData)
                    var error: NSError?
                    let jsonData:NSDictionary = NSJSONSerialization.JSONObjectWithData(urlData!, options:NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary
                    let success:NSInteger = jsonData.valueForKey("success") as NSInteger
                    //[jsonData[@"success"] integerValue];
                    if(success == 1)
                    {
                        NSLog("Sign Up SUCCESS");
                        self.dismissViewControllerAnimated(true, completion: nil)
                    } else {
                        var error_msg:NSString
                        
                        if jsonData["error_message"] as? NSString != nil {
                            error_msg = jsonData["error_message"] as NSString
                        } else {
                            error_msg = "Unknown Error"
                        }
                        var alertView:UIAlertView = UIAlertView()
                        alertView.title = "Sign Up Failed!"
                        alertView.message = error_msg
                        alertView.delegate = self
                        alertView.addButtonWithTitle("OK")
                        alertView.show()
                        
                    }
                    
                } else {
                    var alertView:UIAlertView = UIAlertView()
                    alertView.title = "Sign Up Failed!"
                    alertView.message = "Connection Failed"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("OK")
                    alertView.show()
                }
            }  else {
                var alertView:UIAlertView = UIAlertView()
                alertView.title = "Sign in Failed!"
                alertView.message = "Connection Failure"
                if let error = responseError {
                    alertView.message = (error.localizedDescription)
                }
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()
            }
                */
        }

    }
    @IBAction func btnGotoLogin(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
