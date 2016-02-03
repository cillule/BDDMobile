//
//  Category+CoreDataProperties.swift
//  MyNotes
//
//  Created by Alexis LP on 03/02/2016.
//  Copyright © 2016 iem. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Category {

    @NSManaged var name: String?
    @NSManaged var color: String?
    @NSManaged var updateAt: NSDate?
    @NSManaged var createdAt: NSDate?
    @NSManaged var notes: NSSet?

}
