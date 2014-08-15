//
//  RegisterViewController.swift
//  votematch
//
//  Created by Looker, Shawn on 8/14/14.
//  Copyright (c) 2014 CodeForVegas.org. All rights reserved.
//

import UIKit
import CoreData


class RegisterViewController: UIViewController, NSURLConnectionDelegate {
    
    @IBOutlet weak var address1: UITextField!
    @IBOutlet weak var address2: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zipcode: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func saveUser() {
        var address1Text = address1.text
        var address2Text = address2.text
        var cityText = city.text
        var stateText = state.text
        var zipcodeText = zipcode.text
        
        var count = address1.text.utf16Count
        
        let api_url = "http://54.186.154.18"

        
        if (address1.text.utf16Count == 0 ||
            city.text.utf16Count == 0 ||
            state.text.utf16Count == 0 ||
            zipcode.text.utf16Count == 0) {
            var error: String = "You must fill in at least address1, city, state and zipcode"
            Alert.alertMessage("Error", message: error)

        } else {
            println("We should be saving now")
            
            let urlPath: String = "\(api_url)/users"
            
            Alamofire.request(.GET, urlPath)
                .responseJSON {(request, response, JSON, error) in
                    println(JSON)
                    var userData: NSDictionary = JSON as NSDictionary
                    if let error: String = userData.valueForKey("error") as? String {
                        Alert.alertMessage("Error", message: error)
                    } else {
                        var userId = userData.valueForKey("userId")
                        
                        /* 
                            { "users": {
                                "userId": "123456"
                                }
                            }
                        */

                        println(userId)
                        self.saveUser(tilUser)
                    }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}
