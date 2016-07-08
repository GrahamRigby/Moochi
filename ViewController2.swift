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
    
    func DistributeThree(Dict1: Dictionary<String, Double>, Dict2: Dictionary<String, Double>) {
}
}


class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // This is code that will add a textfield to the code later we may want to change it to a label
    // Also use cariables so they aren't all on top of one another
    // Also create an alert that will come up to put in the names of people maybe see if this is a good
    // Idea later it could create issues if people don't know the name's 
    // Remember to keep it simple
    // Here is also a good place to add a counter for the mathy part for splitting costs
    // Also this may not work it's creating variables that might coexist
    @IBAction func createView(sender : UIButton!) {
        let sizeAndLocation = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 30.0)
        let text = UITextField(frame: sizeAndLocation)
        let view = UIView(frame: sizeAndLocation)
        view.addSubview(text)
    }
}
