//
//  ViewController3.swift
//  Moochi
//
//  Created by Graham Rigby on 8/2/16.
//  Copyright © 2016 Graham Rigby. All rights reserved.
//

import UIKit
import MapKit

// A class for events contains information such as coordinates and event title
class EventAnnotations {
    var latitude = 0.00
    var longitude = 0.00
    var title = ""
    var description = ""
    var categories = []
    func EventComplete() -> Bool {
        return (latitude != 0.00 && longitude != 0.00 && title != "")
    }
}

class ViewController3: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var LocationFind: UIButton!
    @IBOutlet weak var MapType: UISegmentedControl!
    @IBOutlet weak var FilterButton: UIButton!
    @IBOutlet weak var CategoryView: UIView!
    @IBOutlet weak var FoodButton: UIButton!
    @IBOutlet weak var MusicButton: UIButton!
    @IBOutlet weak var CharityButton: UIButton!
    @IBOutlet weak var ShowButton: UIButton!
    @IBOutlet weak var DrinkButton: UIButton!
    @IBOutlet var ViewScreen: UIView!
    var FoodSelected = false
    var MusicSelected = false
    var CharitySelected = false
    var ShowSelected = false
    var DrinkSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // sets map and region to user location
        mapView.showsUserLocation = true
        let userLocation = mapView.userLocation
        let region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 1000, 1000)
        mapView.setRegion(region, animated: true)
        mapView.mapType = .Standard
        CategoryView.hidden = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController3.tap(_:)))
        tapGesture.cancelsTouchesInView = true
        ViewScreen.addGestureRecognizer(tapGesture)
        // this loops through all the events in a list and makes them into annotations on the map
        //for thing in EventList {
            //let annotation = MKPointAnnotation()
            //annotation.coordinate = CLLocationCoordinate2D(latitude: thing.latitude, longitude: thing.longitude)
            //annotation.title = thing.title
            //annotation.subtitle = "In Toronto :)"
            //mapView.addAnnotation(annotation)
        //}
        
        // temporary link up to a website to pull json formatted string of data
        var url = NSURL(string: "https://api.myjson.com/bins/57z7o.json")
        if url != nil {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
                print(data)
                if error == nil {
                    var urlContent = NSString(data: data!, encoding: NSASCIIStringEncoding) as NSString!
                    print(urlContent)
                }
            })
            task.resume()
        }
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 43.6543970, longitude: -79.3955520)
        annotation.title = "Test"
        annotation.subtitle = "Toronto:"
        mapView.addAnnotation(annotation)
    }
    
    func tap(gesture: UITapGestureRecognizer) {
        CategoryView.hidden = true
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ShowCategories(sender: UIButton!) {
        CategoryView.hidden = false
    }
    
    @IBAction func FoodButtonTapped(sender: UIButton!) {
        if (FoodSelected == false) {
            FoodButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            FoodButton.backgroundColor = UIColor.redColor()
            FoodSelected = true
        }
        
        else {
            FoodButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            FoodButton.backgroundColor = UIColor.whiteColor()
            FoodSelected = false
        }
    }
    
    @IBAction func MusicButtonTapped(sender: UIButton!) {
        if (MusicSelected == false) {
            MusicButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            MusicButton.backgroundColor = UIColor.redColor()
            MusicSelected = true
        }
            
        else {
            MusicButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            MusicButton.backgroundColor = UIColor.whiteColor()
            MusicSelected = false
        }
    }
    
    @IBAction func CharityButtonTapped(sender: UIButton!) {
        if (CharitySelected == false) {
            CharityButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            CharityButton.backgroundColor = UIColor.redColor()
            CharitySelected = true
        }
            
        else {
            CharityButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            CharityButton.backgroundColor = UIColor.whiteColor()
            CharitySelected = false
        }
    }
    
    @IBAction func ShowButtonTapped(sender: UIButton!) {
        if (ShowSelected == false) {
            ShowButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            ShowButton.backgroundColor = UIColor.redColor()
            ShowSelected = true
        }
            
        else {
            ShowButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            ShowButton.backgroundColor = UIColor.whiteColor()
            ShowSelected = false
        }
    }
    
    @IBAction func DrinkButtonTapped(sender: UIButton!) {
        if (DrinkSelected == false) {
            DrinkButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            DrinkButton.backgroundColor = UIColor.redColor()
            DrinkSelected = true
        }
            
        else {
            DrinkButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            DrinkButton.backgroundColor = UIColor.whiteColor()
            DrinkSelected = false
        }
    }
    
    // re-centers the map to the user's current location
    @IBAction func ShowCurrentLocation(sender: AnyObject) {
        let userLocation = mapView.userLocation
        
        let region = MKCoordinateRegionMakeWithDistance(
            userLocation.coordinate, 1000, 1000)
        
        mapView.setRegion(region, animated: true)
    }
    
    // changes the map type
    @IBAction func mapTypeChange(sender: UISegmentedControl) {
        if (MapType.selectedSegmentIndex == 0) {
            mapView.mapType = .Standard
        }
        else if (MapType.selectedSegmentIndex == 1) {
            mapView.mapType = .Hybrid
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
