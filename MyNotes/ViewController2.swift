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
    @IBOutlet weak var saveButton: UINavigationItem!
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

    @IBAction func buttonSaveClick(sender: AnyObject) {
        
        let noteManager = NoteManager();
        noteManager.createNote( titleContent.text, text: texteContent.text)
        note?.title = titleContent.text
        note?.text = texteContent.text
        
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
