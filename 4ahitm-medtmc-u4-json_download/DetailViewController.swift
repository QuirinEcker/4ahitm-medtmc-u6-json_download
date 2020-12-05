//
//  DetailViewController.swift
//  4ahitm-medtmc-u4-json_download
//
//  Created by Quirin Ecker on 05.12.20.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var idField: UILabel!
    @IBOutlet weak var titleField: UILabel!
    @IBOutlet weak var userIdField: UILabel!
    @IBOutlet weak var completedField: UILabel!
    var rowId: Int = 0
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idField.text = "\(self.model.todos[rowId].id)"
        titleField.text = "\(self.model.todos[rowId].title)"
        userIdField.text = "\(self.model.todos[rowId].userId)"
        completedField.text = "\(self.model.todos[rowId].completed)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
