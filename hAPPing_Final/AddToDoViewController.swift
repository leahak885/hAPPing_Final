//
//  AddToDoViewController.swift
//  hAPPing_Final
//
//  Created by Leah on 8/8/20.
//  Copyright © 2020 Leah Kvares. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    @IBAction func addTapped(_ sender: UIButton) {
        
        //have to grab this view context to be able to work with Core Data
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

          //creating a new ToDoCD object here, naming it toDo
          let toDo = toDoCD(entity: toDoCD.entity(), insertInto: context)

          // if the titleTextField has text, call that text titleText
          if let titleText = titleTextField.text {
              // take the titleText and assign that value to toDo.name
              // this .name and .important came from the attributes typed in on the Core Data page
              toDo.name = titleText
              toDo.important = importantSwitch.isOn
          }

          try? context.save()

          navigationController?.popViewController(animated: true)
        }

        let toDo = ToDo()

        if let titleText = titleTextField.text {
          toDo.name = titleText
          toDo.important = importantSwitch.isOn
        }
        previousVC.toDos.append(toDo)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
 
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
