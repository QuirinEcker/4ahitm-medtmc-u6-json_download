//
//  ViewController.swift
//  4ahitm-medtmc-u4-json_download
//
//  Created by Quirin Ecker on 14.11.20.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    var queue = DispatchQueue(label: "queue1")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("before")
        queue.async {
            self.download()
        }
        print("submitted")
    }
    
    func download() {
        let model = Model()
        
        if let url = URL(string: "https://jsonplaceholder.typicode.com/todos") {
            if let data = try? Data(contentsOf: url) {
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                    if let array = json as? [Any] {
                        for obj in array {
                            if let dict = obj as? [String: Any] {
                                let todo = Todo(
                                    id: dict["id"] as! Int,
                                    userId: dict["userId"] as! Int,
                                    title: dict["title"] as! String,
                                    completed: dict["completed"] as! Bool
                                )
                                
                                model.todos.append(todo)
                            }
                        }
                        
                        DispatchQueue.main.async {
                            print("title downloaded:\(model)")
                            self.model = model
                            
                            self.performSegue(withIdentifier: "loadTodos", sender: self)
                        }
                    }
                }
            } else {
                print("failed to download")
            }
        } else {
            print("sinnlose URL")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "loadTodos" {
            let tableViewController = segue.destination as! TableViewController
            
            tableViewController.model = self.model
        }
    }
}

