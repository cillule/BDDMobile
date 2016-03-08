//
//  ViewController.swift
//  MyNotes
//  Created by iem on 03/02/2016.
//  Copyright © 2016 iem. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController{

 
    
    var appDelegate : AppDelegate{
        
        return  UIApplication.sharedApplication().delegate as! AppDelegate
    }
    
    var myNotes: [Note]?
    

     override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        tableView.registerClass(UITableViewCell.self,
            forCellReuseIdentifier: "cell")
    }
    
    override  func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        myNotes = NoteManager().fetchNotes()!
        tableView.reloadData()
    }

     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     //MARK: UITableViewDelegate
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete from CoreData
            NoteManager().removeNote(myNotes![indexPath.row])
            // Delete the row from the data source
            myNotes?.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    //MARK: UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let _ = myNotes {
            return myNotes!.count
        }
        
        return 0
    }
    
   override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        let currentNote = myNotes![indexPath.row]
        cell!.textLabel!.text = currentNote.valueForKey("title") as? String
        return cell!
    }


}

