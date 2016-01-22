//
//  ViewController.swift
//  Where Am I
//
//  Created by Tingbo Chen on 1/13/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
/*
To Set Up User location:
-Build Phases > Link Binary With Libraries > + > CoreLocation.framework
-In "Info.plist" add:
-NSLocationWhenInUseUsageDescription  Type: String, Value: Would you like to share your location?
*/

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    @IBOutlet var latOutlet: UILabel!
    
    @IBOutlet var longOutlet: UILabel!
    
    @IBOutlet var courseOutlet: UILabel!
    
    @IBOutlet var speedOutlet: UILabel!
    
    @IBOutlet var addressOutlet: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting User Location:
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        //Creating the Map
        let latitude:CLLocationDegrees = 38.897
        let longitude:CLLocationDegrees = -77.055
        let latDelta:CLLocationDegrees = 0.01
        let longDelta:CLLocationDegrees = 0.01
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        mapView.setRegion(region, animated: true)
        
        
    }
    
    //Function for Updating User location to center on User
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0]
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        let latDelta:CLLocationDegrees = 0.01
        let longDelta:CLLocationDegrees = 0.01
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        self.mapView.setRegion(region, animated: true)
        
        //Getting Specifications:
        
        self.latOutlet.text = String(round(userLocation.coordinate.latitude * 2.0)/2.0)
        self.longOutlet.text = String(round(userLocation.coordinate.longitude * 2.0)/2.0)
        self.speedOutlet.text = String(userLocation.speed)
        self.courseOutlet.text = String(userLocation.course)

        //print(locations[0]) //for testing
        
        //Closest Address
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let p = placemarks![0] as CLPlacemark!
                //print(p) //for testing
                
                var subThoroughfare = p.subThoroughfare
                
                if (p.subThoroughfare == nil){
                    subThoroughfare = ""
                }
                self.addressOutlet.text = "\(subThoroughfare!) \(p.thoroughfare!)\n\(p.subAdministrativeArea!) \(p.postalCode!)"
                
            }
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

