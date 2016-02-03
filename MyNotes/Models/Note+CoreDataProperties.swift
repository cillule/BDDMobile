//
//  Note+CoreDataProperties.swift
//  MyNotes
//
//  Created by iem on 03/02/2016.
//  Copyright © 2016 iem. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Note {

    @NSManaged var createdAt: NSDate
    @NSManaged var title: String?
    @NSManaged var updatedAt: NSDate
    @NSManaged var text: String?
    @NSManaged var category: Category?

}
