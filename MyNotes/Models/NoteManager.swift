//
//  NoteManager.swift
//  MyNotes
///Users/iem/Documents/BD_Mobile/MyNotes/MyNotes/ViewController.swift/Users/iem/Documents/BD_Mobile/MyNotes/MyNotes/ViewController.swift
//  Created by iem on 03/02/2016.
//  Copyright © 2016 iem. All rights reserved.
///Users/iem/Documents/BD_Mobile/MyNotes/MyNotes/ViewController.swift

import UIKit
import CoreData

class NoteManager: NSObject {
    
    
    var appDelegate : AppDelegate{
         return  UIApplication.sharedApplication().delegate as! AppDelegate
    }
    
    var managedObjectContext: NSManagedObjectContext{
        return appDelegate.managedObjectContext;
    }
    
  
    func createNote(title: String, texte: String) -> Note{
        
        let entity = NSEntityDescription.entityForName("Note", inManagedObjectContext: managedObjectContext)
        
        let note = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext) as!Note
        
        note.title = title
        note.text = texte
    
        
        do {
        
            try managedObjectContext.save()
            
       
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        
        return note
    
    }
    
    
    func fetchNotes() -> [Note]? {
        let fetchRequest = NSFetchRequest(entityName: "Note")
        
        let titleSortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        
        let dateSortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        
        fetchRequest.sortDescriptors = [titleSortDescriptor, dateSortDescriptor]
        
      
    
        
        do {
            let results = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Note]
            
            return results
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        
        return [Note]()
    }
    

}
