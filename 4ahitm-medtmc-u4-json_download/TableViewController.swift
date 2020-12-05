//
//  TableViewController.swift
//  4ahitm-medtmc-u4-json_download
//
//  Created by Quirin Ecker on 14.11.20.
//

import UIKit

class TableViewController: UITableViewController {
    var model = Model()
    var queue = DispatchQueue(label: "queue1")
    var selectedIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        print("before")
        queue.async {
            self.download()
        }
        print("submitted")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.todos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todo", for: indexPath) as! TableViewCell
        let todo = model.todos[indexPath.row]

        cell.title?.text = todo.title
        cell.info?.text = "id: \(todo.id), userId: \(todo.userId)"
        cell.switch.isOn = todo.completed

        if todo.completed {
            cell.completedLabel?.text = "completed"
        } else {
            cell.completedLabel?.text = "uncompleted"
        }

        return cell
    }
    
    func download() {
        let model = Model()
        
        if let url = URL(string: "http://localhost:3000/todos") {
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
                            self.tableView.reloadData()
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        performSegue(withIdentifier: "showTodo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTodo" {
            if let detailViewController = segue.destination as? DetailViewController {
                detailViewController.rowId = self.selectedIndex
                detailViewController.model = self.model
            }
        }
    }

}
