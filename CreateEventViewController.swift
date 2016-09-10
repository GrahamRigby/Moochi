//
//  CreateEventViewController.swift
//  Moochi
//
//  Created by Graham Rigby on 8/19/16.
//  Copyright © 2016 Graham Rigby. All rights reserved.
//

import UIKit
import MapKit

class EventInfo {
    var Latitude = 0.00
    var Longitude = 0.00
    var Name = ""
    var Description = ""
    var Categories = [String]()
}

class CreateEventViewController: UIViewController, MKMapViewDelegate, UITextFieldDelegate {
    // References for User Interface objects
    @IBOutlet weak var EventDiagnosticsView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var EventName: UITextField!
    @IBOutlet weak var MapType: UISegmentedControl!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var DescriptionButton: UIButton!
    @IBOutlet weak var DescriptionView: UIView!
    @IBOutlet weak var FoodButton: UIButton!
    @IBOutlet weak var MusicButton: UIButton!
    @IBOutlet weak var CharityButton: UIButton!
    @IBOutlet weak var ShowButton: UIButton!
    @IBOutlet weak var DrinkButton: UIButton!
    @IBOutlet weak var DescriptionText: UITextView!
    @IBOutlet weak var DescriptionDone: UIButton!
    @IBOutlet weak var BackButton: UIButton!
    
    // Booleans for enabled categories
    var foodSelected = false
    var musicSelected = false
    var charitySelected = false
    var showSelected = false
    var drinkSelected = false
    
    // function that runs when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // sets default map region to your location
        mapView.showsUserLocation = true
        let userLocation = mapView.userLocation
        let region = MKCoordinateRegionMakeWithDistance(
            userLocation.coordinate, 1000, 1000)
        mapView.setRegion(region, animated: true)
        // hides the view where you add a description
        DescriptionView.hidden = true
        // used to set up tap gesture recognizer on the EventDiagnosticsView
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CreateEventViewController.hideKeyboard))
        tapGesture.cancelsTouchesInView = true
        EventDiagnosticsView.addGestureRecognizer(tapGesture)
        self.EventName.delegate = self
    }
    
    // hides keyboard when tapping anywhere outside the keyboard on the EventDiagnosticsView
    func hideKeyboard() {
        EventName.endEditing(true)
    }
    
    // hides keyboard when editing the EventName Textfield by tapping return key
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // hides the EventDiagnosticsView allowing user to now enter a location
    @IBAction func DiagnosticsEntered(sender: UIButton!) {
        EventDiagnosticsView.hidden = true
    }
    
    // a back button to allow user to go back to EventDiagnosticsView
    @IBAction func BackToDiagnosticsView(sender: UIButton!) {
        EventDiagnosticsView.hidden = false
    }
    
    // highlights food button and changes boolean value depending on if the button is selected
    @IBAction func foodSelected(sender: UIButton!) {
        if (foodSelected == false) {
            foodSelected = true
            FoodButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            FoodButton.backgroundColor = UIColor.redColor()
        }
        // unhighlights and changes boolesn value back to false
        else {
            foodSelected = false
            FoodButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            FoodButton.backgroundColor = UIColor.whiteColor()
        }
    }
    
    // highlights music button and changes boolean value depending on if the button is selected
    @IBAction func musicSelected(sender: UIButton!) {
        if (musicSelected == false) {
            musicSelected = true
            MusicButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            MusicButton.backgroundColor = UIColor.redColor()
        }
        // unhighlights and changes boolesn value back to false
        else {
            musicSelected = false
            MusicButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            MusicButton.backgroundColor = UIColor.whiteColor()
        }
    }
    
    // highlights charity button and changes boolean value depending on if the button is selected
    @IBAction func charitySelected(sender: UIButton!) {
        if (charitySelected == false) {
            charitySelected = true
            CharityButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            CharityButton.backgroundColor = UIColor.redColor()
        }
        // unhighlights and changes boolesn value back to false
        else {
            charitySelected = false
            CharityButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            CharityButton.backgroundColor = UIColor.whiteColor()
        }
    }
    
    // highlights show button and changes boolean value depending on if the button is selected
    @IBAction func showSelected(sender: UIButton!) {
        if (showSelected == false) {
            showSelected = true
            ShowButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            ShowButton.backgroundColor = UIColor.redColor()
        }
        // unhighlights and changes boolesn value back to false
        else {
            showSelected = false
            ShowButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            ShowButton.backgroundColor = UIColor.whiteColor()
        }
    }
    
    // highlights drink button and changes boolean value depending on if the button is selected
    @IBAction func drinkSelected(sender: UIButton!) {
        if (drinkSelected == false) {
            drinkSelected = true
            DrinkButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            DrinkButton.backgroundColor = UIColor.redColor()
        }
        // unhighlights and changes boolesn value back to false
        else {
            drinkSelected = false
            DrinkButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            DrinkButton.backgroundColor = UIColor.whiteColor()
        }
    }
    
    // shows DescriptionView and keyboard
    @IBAction func AddDescription(sender: UIButton!){
        DescriptionView.hidden = false
        DescriptionText.endEditing(false)
        DescriptionText.becomeFirstResponder()
    }
    
    // hides DescriptionView and keyboard
    @IBAction func DoneDescription(sender: UIButton!){
        DescriptionView.hidden = true
        DescriptionText.endEditing(true)
    }
    
    // re-centers the map at user's current location
    @IBAction func centerLocation(sender: UIButton!) {
        let userLocation = mapView.userLocation
        let region = MKCoordinateRegionMakeWithDistance(
            userLocation.coordinate, 1000, 1000)
        mapView.setRegion(region, animated: true)
    }
    
    // changes the map type with UISegmentedControl
    @IBAction func mapTypeChange(sender: UISegmentedControl!) {
        if (MapType.selectedSegmentIndex == 0) {
            mapView.mapType = .Standard
        }
        else if (MapType.selectedSegmentIndex == 1) {
            mapView.mapType = .Hybrid
        }
    }
    
    // Brings up an alert view asking if you're sure you want to create the event
    @IBAction func CreateEvent (sender: UIButton!) {
        let EventFinal = EventInfo()
        EventFinal.Latitude = mapView.centerCoordinate.latitude
        EventFinal.Longitude = mapView.centerCoordinate.longitude
        EventFinal.Name = EventName.text!
        EventFinal.Description = DescriptionText.text!
        if (foodSelected) {
            EventFinal.Categories.append("Food")
        }
        if (musicSelected) {
            EventFinal.Categories.append("Music")
        }
        if (charitySelected) {
            EventFinal.Categories.append("Charity")
        }
        if (showSelected) {
            EventFinal.Categories.append("Show")
        }
        if(drinkSelected) {
            EventFinal.Categories.append("Drink")
        }
        
        //if (EventName.text!.characters.count < 3) {
            //let alert = UIAlertController(title: "Incomplete Description", message: "Please make event name 3 or more characters and a valid location", preferredStyle: UIAlertControllerStyle.Alert)
            //alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            //self.presentViewController(alert, animated: true, completion: nil)
        //}
        //let alert = UIAlertController(title: "", message: "Are you sure you want to create event " + EventName.text! + "?", preferredStyle: UIAlertControllerStyle.Alert)
        //alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        //alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        //self.presentViewController(alert, animated: true, completion: nil)
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
