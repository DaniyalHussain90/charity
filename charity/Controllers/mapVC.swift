//
//  mapVC.swift
//  charity
//
//  Created by Daniyal Hussain on 28/09/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit
import GoogleMaps
class mapVC: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    let locationManager = CLLocationManager()
    let marker: GMSMarker = GMSMarker() // Allocating Marker

    @IBOutlet weak var buttonS: UIButton!
    @IBOutlet weak var map: GMSMapView!
    @IBOutlet weak var searchButton2: UISearchBar!
    @IBOutlet weak var bckButton1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.showSpinningWheel(_:)), name: NSNotification.Name(rawValue: "notification"), object: nil)
        
        self.locationManager.requestAlwaysAuthorization()
        map.settings.myLocationButton = true
        map.isMyLocationEnabled = true
        self.map.delegate = self
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

    @IBAction func searchButton(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myvc = storyBoard.instantiateViewController(withIdentifier: "searchLocation") as! searchLocation
        self.navigationController?.pushViewController(myvc, animated: true)
    }
    
    @objc func showSpinningWheel(_ notification: NSNotification) {

     if let name = notification.userInfo?["locName"] as? String {
     // do something with your image
        if let lat = notification.userInfo?["locLat"] as? Double {
            if let long = notification.userInfo?["locLongitude"] as? Double {
                self.searchButton2.text = name
                print(name)
                map.animate(to: GMSCameraPosition(latitude: lat, longitude: long, zoom: 30))
        }
    }
     }
        
        

       
}
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue: CLLocationCoordinate2D = locationManager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        map.animate(to: GMSCameraPosition(latitude: locValue.latitude, longitude: locValue.longitude, zoom: 50))
        let marker: GMSMarker = GMSMarker() // Allocating Marker

         marker.title = "Title" // Setting title
         marker.snippet = "Sub title" // Setting sub title
         marker.icon = UIImage(named: "") // Marker icon
         marker.appearAnimation = .pop // Appearing animation. default
        marker.position = map.camera.target // CLLocationCoordinate2D

     //   DispatchQueue.main.async { // Setting marker on mapview in main thread.
           marker.map = map // Setting marker on Mapview
     //   }
    }
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        marker.map = map
                    marker.position = CLLocationCoordinate2D(latitude: position.target.latitude, longitude: position.target.longitude)
    }
    
    func cameraMoveToLocation(toLocation: CLLocationCoordinate2D?) {
        if toLocation != nil {
            map.camera = GMSCameraPosition.camera(withTarget: toLocation!, zoom: 20)
        }
    }

    @IBAction func bckButton1(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    @IBAction func addLocation(_ sender: Any) {
        print(marker.position)
        self.navigationController?.popViewController(animated: true)
        let imageDataDict = ["text": self.searchButton2.text]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationName"), object: nil, userInfo: imageDataDict)


    }

}
