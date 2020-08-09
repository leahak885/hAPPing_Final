//
//  ToDoTableViewController.swift
//  hAPPing_Final
//
//  Created by Leah on 8/8/20.
//  Copyright © 2020 Leah Kvares. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var toDos : [toDoCD] = []
    
    func getToDos() {
      if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

        if let coreDataToDos = try? context.fetch(toDoCD.fetchRequest()) as? [toDoCD] {
            if let theToDos = coreDataToDos {
                toDos = theToDos
                tableView.reloadData()
            }
        }
      }
    }
    
    var toDos : [ToDo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      getToDos()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }

    func createToDos() -> [ToDo] {
        let swift = ToDo()
        swift.name = "Learn Swift"
        swift.important = true
        let dog = ToDo ()
        dog.name = "Walk the Dog"
        
        return [swift, dog]
    }
        
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

      // this gives us a single ToDo
      let toDo = toDos[indexPath.row]

      performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let toDo = toDos [indexPath.row]
        
        if toDo.important {
            cell.textLabel?.text = "❗️" + toDo.name
        } else {
            cell.textLabel?.text = toDo.name
        }
        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddToDoViewController {
          addVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? CompleteToDoViewController {
          if let toDo = sender as? ToDo {
            completeVC.selectedToDo = toDo
            completeVC.previousVC = self
          }
        }
    }
}
