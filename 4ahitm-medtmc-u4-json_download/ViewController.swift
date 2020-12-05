//
//  ViewController.swift
//  4ahitm-medtmc-u4-json_download
//
//  Created by Quirin Ecker on 14.11.20.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func download() {

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "loadTodos" {
            let tableViewController = segue.destination as! TableViewController
            
            tableViewController.model = self.model
        }
    }
}

