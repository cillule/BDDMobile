//
//  ViewController2.swift
//  MyNotes
//
//  Created by iem on 10/02/2016.
//  Copyright © 2016 iem. All rights reserved.
//

import UIKit

class ViewController2: UIViewController,  UITableViewDelegate, UITableViewDataSource, CreateCategoryDelegate{

   
    // MARK: Properties
    @IBOutlet weak var titleContent: UITextField!
    @IBOutlet weak var texteContent: UITextView!
    @IBOutlet weak var categoryTableView: UITableView!
    
   
    var myCategories: [Category]?
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTableView.registerClass(UITableViewCell.self,
            forCellReuseIdentifier: "cell")


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        myCategories = CategoryManager.fetchCategories(CategoryManager())()!
        categoryTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if editingStyle == .Delete {
            // Delete from CoreData
            CategoryManager().removeCategory(myCategories![indexPath.row])
            // Delete the row from the data source
            myCategories?.removeAtIndex(indexPath.row)
            categoryTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    //MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let _ = myCategories {
            return myCategories!.count
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        let currentCatogory = myCategories![indexPath.row]
        cell!.textLabel!.text = currentCatogory.valueForKey("name") as? String
        return cell!
    }
    
    // MARK: Actions
    
    @IBAction func buttonBackClicked(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func buttonSaveClicked(sender: AnyObject) {
        
        let noteManager = NoteManager();
        noteManager.createNote( titleContent.text, text: texteContent.text)
        note?.title = titleContent.text
        note?.text = texteContent.text
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueAddCategory"{
            let destination = segue.destinationViewController as! AddCategoryViewController
            destination.delegate = self
        }
    }
    
    func userDidCreateCategory(title: String, color: UIColor){
        let categoryManager = CategoryManager();
        
        var colorAsString:String!
        
        
        switch color {
        case (UIColor.whiteColor()):
            colorAsString = "white"
        case (UIColor.blueColor()):
            colorAsString = "blue"
        case (UIColor.redColor()):
            colorAsString = "red"
        case (UIColor.greenColor()):
            colorAsString = "green"
        default:
            colorAsString = "white"
        }
        
        categoryManager.createCategory(title, color: colorAsString)
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }


}
