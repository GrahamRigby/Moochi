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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(sender : UIButton) {
        if usernameInput.text == "Graham" && passwordInput.text == "Rigby" {
            //Add Action that takes it to the next screen to log in
        }
    }
  }
