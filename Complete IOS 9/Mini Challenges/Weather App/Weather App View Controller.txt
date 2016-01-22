//
//  FirstViewController.swift
//  Weather App
//
//  Created by Tingbo Chen on 1/5/16.
//  Copyright © 2016 Tingbo Chen. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var imageBackground: UIImageView!
    
    @IBOutlet var cityNameOutput: UILabel!

    @IBOutlet var cityInputField: UITextField!
    
    @IBOutlet var weatherOutput: UILabel!
    
    @IBAction func weatherButton(sender: AnyObject?) {
        
        if cityInputField.text != "" {
            cityNameOutput.text = cityInputField.text
            
            let city_dict = ["Washington, D.C.": "washington-dc", "Washington D.C.": "washington-dc", "Washington": "washington-dc", "St. Louis" : "saint-louis-1", "Saint Louis" : "saint-louis-1"]
            
            let cityNameConvert = NSString(string: cityNameOutput.text!)
            
            var cityNameAppend: [AnyObject] = []
            
            //var weatherOutput_raw: [AnyObject] = []
            
            if city_dict[cityNameConvert as String] != nil {
               let cityNameJoined = city_dict[cityNameConvert as String]!
                cityNameAppend.append(cityNameJoined)

            } else {
                //print("Not in Dictionary") //For testing
                let cityName_ls = cityNameConvert.componentsSeparatedByString(" ")
                let cityNameJoined = cityName_ls.joinWithSeparator("-")
                cityNameAppend.append(cityNameJoined)
            }
            
            let url_str = "http://www.weather-forecast.com/locations/" + String(cityNameAppend[0]).lowercaseString + "/forecasts/latest"
            
            //print(url_str) //For testing

            let url = NSURL(string: url_str)!
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
                
                if let urlContent = data { //Checking if data exists
                    
                    let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding) //Decode message
                    
                    //print(webContent) //for testing
                    
                    let websiteArray = webContent?.componentsSeparatedByString("3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                    
                    if websiteArray!.count == 2 {
                        
                        let websiteArray2 = websiteArray![1].componentsSeparatedByString("</span></span></span></p>")
                        
                        //print(websiteArray2[0]) //For testing
                        
                        let weatherOutput_str = websiteArray2[0].stringByReplacingOccurrencesOfString("&deg", withString: "º")
                        
                        //print(weatherOutput_str) //for testing
                        
                        dispatch_async(dispatch_get_main_queue()) {
                            self.weatherOutput.text = String(weatherOutput_str)
                        }
                        
                        
                    } else {
                        self.weatherOutput.text = "City name was not found."
                    }
                    
                } else {
                    self.weatherOutput.text = "City name was not found."
                }
            }
            
            task.resume()
            
            cityInputField.text = nil
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cityInputField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Tapping Outside the keyboard will close it:
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

        
        self.view.endEditing(true)
    }
    
    //Tapping "Return" will close the keyboard:
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        self.weatherButton(nil)
        
        return true
    }


}

