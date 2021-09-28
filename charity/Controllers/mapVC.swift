//
//  mapVC.swift
//  charity
//
//  Created by Daniyal Hussain on 28/09/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit
import GoogleMaps
class mapVC: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()

    @IBOutlet weak var buttonS: UIButton!
    @IBOutlet weak var map: GMSMapView!
    @IBOutlet weak var searchButton2: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.showSpinningWheel(_:)), name: NSNotification.Name(rawValue: "notification"), object: nil)
        
        self.locationManager.requestAlwaysAuthorization()

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
                map.animate(to: GMSCameraPosition(latitude: lat, longitude: long, zoom: 50))
        }
    }
     }
       
       
}
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }

}
