//
//  ViewController.swift
//  Location aware
//
//  Created by Kevin Naik on 17/07/18.
//  Copyright © 2018 Kevin Naik. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate,MKMapViewDelegate {

    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var LatLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var atitudeLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    var localmanager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localmanager.delegate = self
        localmanager.desiredAccuracy = kCLLocationAccuracyBest
        localmanager.requestWhenInUseAuthorization()
        localmanager.startUpdatingLocation()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userlocation: CLLocation = locations[0]
       // print (locations)
        CLGeocoder().reverseGeocodeLocation(userlocation){ (placemarks,error) in
            if error != nil
            {
                print (error)
            }
            else
            {
                if let placemark = placemarks?[0]
                {
                    var address = ""
                    if placemark.subThoroughfare != nil
                    {
                        address = placemark.subThoroughfare! + " "
                    }
                    //var thoroughfare = ""
                    if placemark.thoroughfare != nil
                    {
                        address += placemark.thoroughfare! + "\n"
                    }
                   // let sublocality = ""
                    if placemark.subLocality != nil
                    {
                        address += placemark.subLocality! + "\n"
                    }
                    //let subadmin = ""
                    if placemark.subAdministrativeArea != nil
                    {
                        address += placemark.subAdministrativeArea! + "\n"
                    }
                    //let postcode = ""
                    if placemark.postalCode != nil
                    {
                        address += placemark.postalCode! + "\n"
                    }
                   // let country = ""
                    if placemark.subThoroughfare != nil
                    {
                        address += placemark.country!
                    }
                    self.addressLabel.text = address
                       // setthoroughfare + " " + thoroughfare + "\n" + sublocality + "\n" + subadmin + "\n" + postcode + "\n" + country
                    //print(sublocality + "\n" + subadmin + "\n" + postcode + "\n" + country)
                }
            }
            
        }
        let longitude = userlocation.coordinate.longitude
        longitudeLabel.text = String(longitude)
        let latitude = userlocation.coordinate.latitude
        LatLabel.text = String(latitude)
        courseLabel.text = String(userlocation.course)
        speedLabel.text = String(userlocation.speed)
        atitudeLabel.text = String (userlocation.altitude)
        let longdelta: CLLocationDegrees = 0.05
        let latdelata: CLLocationDegrees = 0.05
        let span = MKCoordinateSpan(latitudeDelta: latdelata, longitudeDelta: longdelta)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude) , span: span)
        map.setRegion(region, animated: true)
        let ann = MKPointAnnotation()
        ann.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        print (ann.coordinate)
        map.addAnnotation(ann)
    }


}

