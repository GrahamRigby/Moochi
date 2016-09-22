//
//  ViewController.swift
//  Moochi
//
//  Created by Graham Rigby on 6/28/16.
//  Copyright © 2016 Graham Rigby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loginButton : UIButton!
    @IBOutlet weak var usernameInput : UITextField!
    @IBOutlet weak var passwordInput : UITextField!
    @IBOutlet weak var createAccount : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Checks username and password and switches to a logged in view controller or brings up an log in error message to continue
    @IBAction func login(sender : UIButton) {
        if usernameInput.text == "Graham" && passwordInput.text == "Rigby" {
            let View2 = storyboard?.instantiateViewControllerWithIdentifier("Name Later")
            self.presentViewController(View2!, animated: true, completion: nil)
        }
        else {
           let alert = UIAlertController(title: "Login Failed", message: "Username or password is incorrect", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    //Switches to a new view controller to create an account
    @IBAction func createView(sender : UIButton!) {
        let View3 = storyboard?.instantiateViewControllerWithIdentifier("Name Later")
        self.presentViewController(View3!, animated: true, completion: nil)
    }
}
