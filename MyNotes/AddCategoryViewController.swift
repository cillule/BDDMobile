//
//  AddCategoryViewController.swift
//  MyNotes
//
//  Created by iem on 10/02/2016.
//  Copyright © 2016 iem. All rights reserved.
//

import UIKit


protocol CreateCategoryDelegate {
    // protocol definition goes here
    func userDidCreateCategory(title: String, color: UIColor)
}

class AddCategoryViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var nameContent: UITextField!
    @IBOutlet weak var colorPicker: UIPickerView!
    @IBOutlet weak var buttonAdd: UIBarButtonItem!
    
    var delegate: CreateCategoryDelegate?
    
    var myCategories: [Category]?

    var pickerDataSource = ["White", "Red", "Green", "Blue"];
    var choosedColor:UIColor? = UIColor.whiteColor();
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.colorPicker.dataSource = self;
        self.colorPicker.delegate = self;
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(row == 0)
        {
            choosedColor = UIColor.whiteColor();
        }
        else if(row == 1)
        {
            choosedColor = UIColor.redColor();
        }
        else if(row == 2)
        {
            choosedColor =  UIColor.greenColor();
        }
        else
        {
            choosedColor = UIColor.blueColor();
        }
    }
    
    // MARK: - Actions
    @IBAction func clickAddButton(sender: AnyObject) {
        delegate?.userDidCreateCategory(nameContent.text!, color: choosedColor!)
    }
    
    
    
    // MARK: - Navigation


}
