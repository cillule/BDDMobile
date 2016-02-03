//
//  ViewController.swift
//  MyNotes
//
//  Created by iem on 03/02/2016.
//  Copyright © 2016 iem. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

 
    @IBOutlet weak var tableView: UITableView!
  
    
    var appDelegate : AppDelegate{
        
        return  UIApplication.sharedApplication().delegate as! AppDelegate
    }
    
    var myNotes: [Note]{
        
        get{
                return NoteManager().fetchNotes()!
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let noteManager = NoteManager();
        noteManager.createNote("My First Note", text: "Balabalaaa")
        title = "\"-- My Notes ---\""
        tableView.registerClass(UITableViewCell.self,
            forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myNotes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        let currentNote = myNotes[indexPath.row]
        cell!.textLabel!.text = currentNote.valueForKey("title") as? String
        return cell!
    }
    
    

    


}

