//
//  SecondViewController.swift
//  ShelterUsers
//
//  Created by Alex Brown on 06/03/2018.
//  Copyright © 2018 Kingfisher digital. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

extension String: Error {}

class NearbyViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {

    
    var viewMap:GMSMapView!
    var users: Bool?

    @IBOutlet weak var usersButton: UIButton!
    @IBOutlet weak var eventsButton: UIButton!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /// Handle Tap
    @IBAction func tapUsers(_ sender: Any) {
        users = true
        viewMap.clear()
        addUsers()
    }
    
    /// Handle Tap
    @IBAction func tapEvents(_ sender: Any) {
        users = false
        viewMap.clear()
        addEvents()
    }
    
    // Used to start getting the users location
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        self.viewMap = GMSMapView(frame: self.view.frame)
        self.view.addSubview(self.viewMap)
        self.view.sendSubview(toBack: viewMap)
        self.viewMap.delegate = self

        // For use when the app is open & in the background
        locationManager.requestAlwaysAuthorization()
        // For use when the app is open
        locationManager.requestWhenInUseAuthorization()
    }
    
    ///
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        determineMyCurrentLocation()
    }
    
    ///
    func determineMyCurrentLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            locationManager.startUpdatingHeading()
        }
        
        DispatchQueue.main.async {
            let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: (self.locationManager.location?.coordinate.latitude)!, longitude: (self.locationManager.location?.coordinate.longitude)!, zoom: 13.0)
            self.viewMap.camera = camera
            self.viewMap.isMyLocationEnabled = true
        }
    }
    
    /// Print out the location to the console
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print(location.coordinate)
        }
    }
    
    /// If we have been deined access give the user the option to change it
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
            showLocationDisabledPopUp()
        }
    }
    
    /// Show the popup to the user if we have been deined access
    func showLocationDisabledPopUp() {
        let alertController = UIAlertController(title: "Background Location Access Disabled",
                                                message: "In order to deliver pizza we need your location",
                                                preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
            if let url = URL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(openAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    /// Custom view
    /// - Parameters :
    ///     - mapView:
    ///     - markerInfoWindow:
    func mapView(_ mapView: GMSMapView!, markerInfoWindow marker: GMSMarker!) -> UIView! {
        //
        guard let users = users else {
            return nil
        }
        //
        let index:Int! = Int(marker.accessibilityLabel!)
        //
        var nibName = ""
        if users {
            nibName = "NearbyInfoWindow"
        } else {
            nibName = "EventNearbyWindow"
        }
        //
        guard let nibView = Bundle.main.loadNibNamed(nibName, owner: self, options: nil) else {
            return nil
        }
        ///
        let nib = nibView[0]
        ///
        if users {
            let customInfoWindow = nib as! NearbyInfoWindow
            customInfoWindow.frame = CGRect(x: 50, y: 500, width: customInfoWindow.frame.width, height: customInfoWindow.frame.height)
        
            customInfoWindow.isUserInteractionEnabled = true
            return customInfoWindow
        } else {
            let customInfoWindow = nib as! EventNearbyWindow
            customInfoWindow.frame = CGRect(x: 50, y: 500, width: customInfoWindow.frame.width, height: customInfoWindow.frame.height)
            
            customInfoWindow.isUserInteractionEnabled = true
            return customInfoWindow
        }
    }
    
    ///
    private func addUsers() {
        
        var positions: [CLLocationCoordinate2D] = []
        
        positions.append(CLLocationCoordinate2D(latitude: 37.79683400, longitude: -122.40441700))
        positions.append(CLLocationCoordinate2D(latitude: 37.79883400, longitude: -122.40241700))
        positions.append(CLLocationCoordinate2D(latitude: 37.79183400, longitude: -122.40341700))
        positions.append(CLLocationCoordinate2D(latitude: 37.78983400, longitude: -122.40141700))
        positions.append(CLLocationCoordinate2D(latitude: 37.78683400, longitude: -122.40941700))

        positions.append(CLLocationCoordinate2D(latitude: 37.78683400, longitude: -122.40041700))
        positions.append(CLLocationCoordinate2D(latitude: 37.79083400, longitude: -122.40101700))

        DispatchQueue.main.async {
            for pos in positions {
                let marker = GMSMarker(position: pos)
                marker.title = "Hello World"
                marker.icon = UIImage(named: "icons8-user-male-50")
                marker.map = self.viewMap
            }
        }

    }
    
    ///
    private func addEvents() {
        
        var positions: [CLLocationCoordinate2D] = []
        
        positions.append(CLLocationCoordinate2D(latitude: 37.78683400, longitude: -122.40541700))
        positions.append(CLLocationCoordinate2D(latitude: 37.79883400, longitude: -122.40641700))
        positions.append(CLLocationCoordinate2D(latitude: 37.79183400, longitude: -122.40741700))
        positions.append(CLLocationCoordinate2D(latitude: 37.79983400, longitude: -122.40141700))
        positions.append(CLLocationCoordinate2D(latitude: 37.79683400, longitude: -122.40241700))
        
        positions.append(CLLocationCoordinate2D(latitude: 37.78683400, longitude: -122.40041700))
        positions.append(CLLocationCoordinate2D(latitude: 37.79083400, longitude: -122.40101700))
        
        DispatchQueue.main.async {
            for pos in positions {
                let marker = GMSMarker(position: pos)
                marker.title = "Hello World"
                marker.icon = UIImage(named: "icons8-calendar-48")
                marker.map = self.viewMap
            }
        }
        
    }
    
    
}
