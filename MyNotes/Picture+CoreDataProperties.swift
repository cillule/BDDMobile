//
//  Picture+CoreDataProperties.swift
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

extension Picture {

    @NSManaged var picture: NSData?
    @NSManaged var createdAt: NSDate?
    @NSManaged var updateAt: NSDate?
    @NSManaged var notes: NSSet?

}
