//
//  ToDoItem.swift
//  CoreDataToDp
//
//  Created by Nico Lassen on 16.01.20.
//  Copyright © 2020 Nico Lassen. All rights reserved.
//

import Foundation
import CoreData

public class ToDoItem: NSManagedObject, Identifiable {
    
    @NSManaged public var createdAt: Date?
    @NSManaged public var title: String?
}

extension ToDoItem {
    
    static func getAllToDoItems() -> NSFetchRequest<ToDoItem> {
        
        let request: NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as! NSFetchRequest<ToDoItem>
        let sortDiscriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDiscriptor]
        
        return request
    }
}
