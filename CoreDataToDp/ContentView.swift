//
//  ContentView.swift
//  CoreDataToDp
//
//  Created by Nico Lassen on 16.01.20.
//  Copyright © 2020 Nico Lassen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems()) var toDoItems: FetchedResults<ToDoItem>
    
    @State private var newToDoItem = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Whats next?")) {
                    HStack {
                        TextField("New item", text: self.$newToDoItem)
                        Button(action: {
                            
                            if
                                !self.newToDoItem.isEmpty,
                                self.newToDoItem != "" {
                                    
                                let toDoItem = ToDoItem(context: self.managedObjectContext)
                                toDoItem.title = self.newToDoItem
                                toDoItem.createdAt = Date()
                                
                                do {
                                    try self.managedObjectContext.save()
                                } catch {
                                    print(error)
                                }
                                
                                self.newToDoItem = ""
                            }
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                Section(header: Text("To Do's")) {
                    ForEach(self.toDoItems) { item in
                        //
                        ToDoItemView(title: item.title!, createdAt: "\(item.createdAt!)")
                    }.onDelete { IndexSet in
                        
                        let deleteItem = self.toDoItems[IndexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("My List"))
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
