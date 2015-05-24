//
//  ViewController.swift
//  Weather
//
//  Created by light on 15/5/24.
//  Copyright (c) 2015年 tuotuode. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController ,CLLocationManagerDelegate{
    let locationManager:CLLocationManager = CLLocationManager()
    
    
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var temperature: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //if(ios8()){
            locationManager.requestAlwaysAuthorization()
        //}
        locationManager.startUpdatingLocation()
    }
    func ios8()->Bool{
        return UIDevice.currentDevice().systemVersion == "8.0"
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var location:CLLocation = locations[locations.count-1] as! CLLocation
        if(location.horizontalAccuracy>0){
            println(location.coordinate.latitude)
            println(location.coordinate.longitude)
            self.updateWeatherInfo(location.coordinate.latitude,longitude: location.coordinate.longitude)
            
            locationManager.stopUpdatingLocation()
        }
    }
    func updateWeatherInfo(latitude:CLLocationDegrees,longitude:CLLocationDegrees){
        let manager = AFHTTPRequestOperationManager()
        let url = "http://api.openweathermap.org/data/2.5/weather"
        let params = ["lat":latitude,"lon":longitude,"cnt":0]
        manager.GET(url, parameters: params,
            success: { (operation:
                AFHTTPRequestOperation!,
                responseObject:AnyObject!) in
                println("JSON: "+responseObject.description!)
                self.updateUISuccess(responseObject as! NSDictionary)
            },failure:{ (operation:
                AFHTTPRequestOperation!,
                error:NSError!) in
                println("error: "+error.localizedDescription)
        })
    }
    func updateUISuccess(jsonResult:NSDictionary!){
        if let tempResult = jsonResult["main"]?["temp"] as? Double{
            var temperature: Double
            if(jsonResult["sys"]?["country"] as! String == "US"){
                temperature = round(((tempResult-273.15)*1.8)+32)
            }else{
                temperature = round(tempResult-273.15)
            }
            self.temperature.text = "\(temperature)"
            self.temperature.font = UIFont.boldSystemFontOfSize(60)
            
            var name = jsonResult["name"] as! String
            self.location.text = "\(name)"
            self.location.font = UIFont.boldSystemFontOfSize(25)
        }else{
            
        }
    }
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println(error)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

