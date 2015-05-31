//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Chad Duffey on 31/05/2015.
//  Copyright (c) 2015 Chad Duffey. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set up datatbase
        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as! NSManagedObject
        
        newUser.setValue("Jess", forKey: "username")
        newUser.setValue("password", forKey: "password")
        
        //save to the db without handling errors
        context.save(nil)
        
        //fetch from db
        var request = NSFetchRequest(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        var results = context.executeFetchRequest(request, error: nil)
        
        //basic debug output
        println(results)
        
        //get straight to the stuff we want instead
        
        if results?.count > 0 {
        
            for result: AnyObject in results! {
            
                println(result)
            
            }
        } else {
            println("Baloney")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

