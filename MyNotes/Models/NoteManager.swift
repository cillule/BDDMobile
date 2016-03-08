//
//  NoteManager.swift
//  MyNotes
//
//  Created by Alexis LP on 03/02/2016.
//  Copyright © 2016 iem. All rights reserved.
//

import UIKit
import CoreData


class NoteManager: NSObject {

    var appDelegate : AppDelegate{
        return  UIApplication.sharedApplication().delegate as! AppDelegate
    }
    
    var managedObjectContext: NSManagedObjectContext{
        return appDelegate.managedObjectContext
    }
    
    func createNote(title:String? , text:String?) -> Note{
        let entity = NSEntityDescription.entityForName("Note", inManagedObjectContext: managedObjectContext)
        let note = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext) as!Note
        if let _ = title{
            note.title = title
        }
        if let _ = text{
            note.text = text
        }
        note.createdAt = NSDate()
        
        do {
            try managedObjectContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        return note
    }
    
    func removeNote(note:Note?){
        
        if let noteToDelete = note {
            appDelegate.managedObjectContext.deleteObject(noteToDelete)
            do{
                try appDelegate.managedObjectContext.save()
            } catch let error as NSError {
                print("Could not remove \(error), \(error.userInfo)")
            }
        }
    }
    
    func fetchNotes() -> [Note]? {
        let fetchRequest = NSFetchRequest(entityName: "Note")
        let dateSortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        fetchRequest.sortDescriptors = [dateSortDescriptor]
        fetchRequest.fetchBatchSize = 20
        
        do {
            let results = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Note]
            return results
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return [Note]()
    }
    
}
