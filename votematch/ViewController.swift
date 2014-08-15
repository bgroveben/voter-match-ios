//
//  ViewController.swift
//  votematch
//
//  Created by Looker, Shawn on 8/14/14.
//  Copyright (c) 2014 CodeForVegas.org. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println("Loading data from core data")
        let userId: String? = loadUser() as String?
        
        if (userId != nil) {
            // We have a user.  Go straight to elections.  Do not pass go.
            println("We have a userId: \(userId)")
            
        } else {
            // We need to create a user.  Show the creater user dialog
            println("No userId.  Moving to register view controller")
            let vc = self.storyboard.instantiateViewControllerWithIdentifier("registerController") as UIViewController
            self.presentViewController(vc, animated: true, completion: nil)
        }
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadUser() -> String? {
        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        
        var request = NSFetchRequest(entityName: "User")
        request.returnsObjectsAsFaults = false
        
        var results: NSArray = context.executeFetchRequest(request, error: nil)
        if (results.count > 0) {
            // do this
            println("Getting user")
            //            var user: User = results[0] as User
            var userData: NSManagedObject = results[0] as NSManagedObject
            //            println("User data: \(userData.name), \(userData.uuid)")
            //            println(userData./
            
            //            var user: TILUser = TILUser(name: userData.name, uuid: userData.uuid, key: userData.key)
            println("Got user")
            var userId: String = userData.valueForKey("id") as String
            return userId
        } else {
            // do that
            println("0 results returned, potential error")
            return nil
            
        }
    }
    
    


}

