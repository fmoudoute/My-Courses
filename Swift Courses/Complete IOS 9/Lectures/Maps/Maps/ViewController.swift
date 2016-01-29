//
//  ViewController.swift
//  Maps
//
//  Created by Tingbo Chen on 1/12/16.
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
    -NSLocationAlwaysUsageDescription  Type: String, Value: Are you allowing app to access your location?
*/


class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UISearchBarDelegate {

    @IBOutlet var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create Map
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        self.mapView.delegate = self
        self.mapView.mapType = MKMapType.Standard
        self.mapView.showsUserLocation = true
        
        //Allowing User to add Annotation
        let uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        uilpgr.minimumPressDuration = 2.5
        self.mapView.addGestureRecognizer(uilpgr)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Functions allow User to drag annotation:
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.draggable = true
        }
        else {
            pinView?.annotation = annotation
        }
        
        return pinView
    }
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, didChangeDragState newState: MKAnnotationViewDragState, fromOldState oldState: MKAnnotationViewDragState) {
        if newState == MKAnnotationViewDragState.Ending {
            let droppedAt = view.annotation?.coordinate
            print(droppedAt)
        }
    }
    
    //Function for Updating User location to center on User:
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        self.mapView.setRegion(region, animated: true)
        
        
        //Adds an Annotation
        let annotation = MKPointAnnotation()
        annotation.coordinate = location!.coordinate
        annotation.title = "New Place"
        annotation.subtitle = "One day I'll own here..."
        self.mapView.addAnnotation(annotation)
        
        //Stops updating
        self.locationManager.stopUpdatingLocation()
    }
    
    //Function for User to Add Annotation
    func action(gestureRecognizer:UIGestureRecognizer) {
        //print("gesture recognized") //for testing
        let touchPoint = gestureRecognizer.locationInView(self.mapView)
        let newCoordinate: CLLocationCoordinate2D = self.mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinate
        annotation.title = "New Place"
        annotation.subtitle = "One day I'll own here..."
        self.mapView.addAnnotation(annotation)
    }

}