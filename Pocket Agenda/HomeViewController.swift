//
//  ViewController.swift
//  Pocket Agenda
//
//  Created by Admin on 9/13/20.
//  Copyright © 2020 Holmes Org. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var itemArray = ["Find Mike", "Buy Shit", "Destriy"]
       
       let defaults = UserDefaults.standard
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
                  itemArray = items
               }
               navigationItem.title = "To Do List"
    }
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
           
           var textField = UITextField()
           
           let alert = UIAlertController(title: "Add a New Task", message: "", preferredStyle: .alert)
       
       
       let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
           //what will happen once the user clicks the Add item on our alert
           self.itemArray.append(textField.text!)
           
           self.defaults.set(self.itemArray, forKey: "ToDoListArray")
           
           self.tableView.reloadData()
       }
           alert.addTextField { (alertTextField) in
               alertTextField.placeholder = "Create new Item"
               textField = alertTextField
           }
           
           alert.addAction(action)
           
           
           
           present(alert, animated: true, completion: nil)
       
      
       }


}

extension HomeViewController: UITableViewDelegate {
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return itemArray.count
      }
      
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
          
          cell.textLabel?.text = itemArray[indexPath.row]
          
          return cell
      }
}
