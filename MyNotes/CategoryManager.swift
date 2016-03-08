//
//  CategoryManager.swift
//  MyNotes
//
//  Created by iem on 10/02/2016.
//  Copyright © 2016 iem. All rights reserved.
//

import UIKit
import CoreData

class CategoryManager: NSObject{
    
    var appDelegate : AppDelegate{
        return UIApplication.sharedApplication().delegate as! AppDelegate
    }
    
    var managedObjectContext : NSManagedObjectContext{
        return appDelegate.managedObjectContext
    }

    func createCategory(name: String?, color:String?)->Category{
        
        let entity = NSEntityDescription.entityForName("Category", inManagedObjectContext: managedObjectContext)
        let category = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext) as!Category
        
        if let _ = name{
            category.name = name
        }
        
        if let _ = color{
            category.color = color
        }
        
        category.createdAt = NSDate()
        
        do{
            try managedObjectContext.save()
        }catch let error as NSError{
            print("Could not save \(error), \(error.userInfo)")
        }
        
        return category
        
    }
    
    
    func removeCategory(category:Category?){
        
        if let categoryToDelete = category {
            appDelegate.managedObjectContext.deleteObject(categoryToDelete)
            do{
                try appDelegate.managedObjectContext.save()
            } catch let error as NSError {
                print("Could not remove \(error), \(error.userInfo)")
            }
        }
    }
    
    func fetchCategories() ->[Category]?{
        
        let fetchRequest = NSFetchRequest(entityName: "Category")
        let dateSortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        fetchRequest.sortDescriptors = [dateSortDescriptor]
        fetchRequest.fetchBatchSize = 10
        
        do{
            let results = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Category]
            return results
        }catch let error as NSError{
            print("Could not save \(error), \(error.userInfo)")
        }
        
        return [Category]()
        
    }




}
