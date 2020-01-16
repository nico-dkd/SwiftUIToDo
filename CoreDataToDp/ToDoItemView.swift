//
//  ToDoItemView.swift
//  CoreDataToDp
//
//  Created by Nico Lassen on 16.01.20.
//  Copyright © 2020 Nico Lassen. All rights reserved.
//

import SwiftUI

struct ToDoItemView: View {
    
    var title = ""
    var createdAt = ""
    
    
    var body: some View {

        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(createdAt)
                    .font(.caption)
            }
        }
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView(title: "Aaaaa", createdAt: "Today")
    }
}
