//
//  Todo.swift
//  4ahitm-medtmc-u4-json_download
//
//  Created by Quirin Ecker on 14.11.20.
//

class Todo {
    var id = 0
    var userId = 0
    var title = ""
    var completed = false
    
    init(id: Int, userId: Int, title: String, completed: Bool) {
        self.id = id
        self.userId = userId
        self.title = title
        self.completed = completed
    }
}
