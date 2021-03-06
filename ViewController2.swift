//
//  ViewController2.swift
//  Moochi
//
//  Created by Graham Rigby on 6/29/16.
//  Copyright © 2016 Graham Rigby. All rights reserved.
//

import UIKit

// Contains a class for dealing with distribution of money and what people owe
class People {
    var names = Dictionary<String, Double>()
    // creates 3 empty dictionaries will be updated in the second distribute method
    // essential for the last distribute method
    var PayBackers = Dictionary<String, Double>()
    var RecieveBackers = Dictionary<String, Double>()
    var ExactPayers = Dictionary<String, Double>()
    var totalCost = 0.0
    
    // This method subtracts the average cost from what everyone paid
    // ex: 5 people share $25 worth of beer averageCost is $5 person who paid the $25 goes down to $20
    // and the rest of the people go down to -$5 thus owing a collective $20 to the person who paid $25
    func DistributeOne() ->Dictionary<String, Double> {
        // AverageCost is the average of what people paid in the names
        totalCost = 0.0
        for (_,payment) in names{
            totalCost += payment
        }
        let AverageCost = totalCost / Double(names.count)
        var NewNames = Dictionary<String, Double>()
        for (person, payment) in names {
            NewNames[person] = Double(payment - AverageCost)
        }
        return NewNames
    }
    
    // This method separates the people that haven't paid enough, paid the avg, and have paid more the avg.
    // It creates three new dictionaries, possibly create new class variables later so we dont have to
    // figure out how to return 3 dictionaries lol just update empty ones same goes for method above
    func DistributeTwo(UpdatedNames: Dictionary<String, Double> ) {
        for (person, payment) in UpdatedNames {
            if UpdatedNames[person] < 0 {
                PayBackers[person] = payment
            }
            else if UpdatedNames[person] > 0 {
                RecieveBackers[person] = payment
            }
            else {
                ExactPayers[person] = 0
            }
        }
    }
    
    // this is gonna be a string with all of people who owe and dont owe put into a label to present for simplicity finish it later
    func ReturnResults() -> String {
        var Results = ""
        if (PayBackers.count) > 0 {
            Results += "Paybackers: \n"
            for (person, amount) in PayBackers {
                Results = Results + person + " owes " + String(amount * -1)
                Results += "\n"
            }
            Results += "\n"
        }
        if (RecieveBackers.count) > 0 {
            Results += "RecieveBackers: \n"
            for (person, amount) in RecieveBackers {
                Results = Results + person + " needs " + String(amount)
                Results += "\n"
            }
            Results += "\n"
        }
        if (ExactPayers.count) > 0 {
            Results += "Exact Payers: \n"
            for (person, _) in ExactPayers {
                Results += person + " has paid respective dues \n"
            }
        }
        return Results
        }
}

class ViewController2: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var AddPersonButton: UIButton!
    @IBOutlet weak var CloseResults: UIButton!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var ViewScreen: UIView!
    var Group = People()
    var VerticalItemDistance = 140
    var PaymentText = Dictionary<UITextField, UITextField>()
    let results = UITextView(frame: CGRectMake(10, 90, 301, 460))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        results.hidden = true
        CloseResults.hidden = true
        // creates Tap Gesture Recognizer that calls function tap
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController2.tap(_:)))
        tapGesture.cancelsTouchesInView = true
        ViewScreen.addGestureRecognizer(tapGesture)
    }
    
    // closes the keyboard called by a Tap Gesture Recognizer
    func tap(gesture: UITapGestureRecognizer) {
        for (names, payments) in PaymentText {
            names.resignFirstResponder()
            payments.resignFirstResponder()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //This brings up an alert view to enter a name
    @IBAction func AddMan(sender: UIButton!) {
        let NameAlert = UIAlertController(title: "Add Person", message: "Enter name", preferredStyle: UIAlertControllerStyle.Alert)
        NameAlert.addTextFieldWithConfigurationHandler {
            (textField) -> Void in
        }
        //Does something when the ok button is pressed for later things add to this
        NameAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: {
            (action) -> Void in
            self.VerticalItemDistance += 25
            //Does name textfield
            let nameTextField = UITextField(frame: CGRectMake(10, CGFloat(self.VerticalItemDistance-10), 180, 20))
            let name = NameAlert.textFields![0] as UITextField
            nameTextField.text = name.text!
            nameTextField.font = UIFont.systemFontOfSize(15)
            nameTextField.borderStyle = UITextBorderStyle.RoundedRect
            nameTextField.autocorrectionType = UITextAutocorrectionType.No
            nameTextField.keyboardType = UIKeyboardType.Default
            nameTextField.returnKeyType = UIReturnKeyType.Done
            nameTextField.clearButtonMode = UITextFieldViewMode.WhileEditing;
            nameTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
            // sets delegate
            nameTextField.delegate = self
            self.view.addSubview(nameTextField)
            //Does payment textfield
            self.PaymentText[nameTextField] = UITextField(frame: CGRectMake(230, CGFloat(self.VerticalItemDistance-10), 75, 20))
            self.PaymentText[nameTextField]!.font = UIFont.systemFontOfSize(15)
            self.PaymentText[nameTextField]!.borderStyle = UITextBorderStyle.RoundedRect
            self.PaymentText[nameTextField]!.autocorrectionType = UITextAutocorrectionType.No
            self.PaymentText[nameTextField]!.keyboardType = UIKeyboardType.Default
            self.PaymentText[nameTextField]!.returnKeyType = UIReturnKeyType.Done
            self.PaymentText[nameTextField]!.clearButtonMode = UITextFieldViewMode.WhileEditing;
            self.PaymentText[nameTextField]!.delegate = self
            self.PaymentText[nameTextField]!.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
            self.view.addSubview(self.PaymentText[nameTextField]!)
        }))
        
        // Just closes the alert view with a cancel button
        NameAlert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: {
            (action) -> Void in
        }))
        self.presentViewController(NameAlert, animated: true, completion: nil)
    }
    
    // hides keyboard when editing the EventName Textfield by tapping return key
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        for (names, payments) in PaymentText {
            names.resignFirstResponder()
            payments.resignFirstResponder()
        }
        return true
    }
    
    @IBAction func FinalAct(sender: UIButton!) {
        Group.PayBackers = Dictionary<String, Double>()
        Group.RecieveBackers = Dictionary<String, Double>()
        Group.ExactPayers = Dictionary<String, Double>()
        // This is the for loop that links the dictionaries that represent name and payment with
        // name and UITextField and modifies the dictionary that represents name and payment with
        // The input money in the TextFields
        for (name,_) in self.PaymentText {
            self.Group.names[name.text!] = Double(self.PaymentText[name]!.text!)
        }
        // This adds the textfield that has a built in scroll interaction if text is longer than size 
        self.Group.DistributeTwo(self.Group.DistributeOne())
        results.hidden = false
        results.text = self.Group.ReturnResults()
        results.font = UIFont(name: "Helvetica", size: 14)
        self.view.addSubview(results)
        BackButton.hidden = true
        CloseResults.hidden = false
    }
    
    @IBAction func CloseResults(sender:UIButton!) {
        results.hidden = true
        CloseResults.hidden = true
        BackButton.hidden = false
    }
}
