//
//  CompleteToDoViewController.swift
//  hAPPing_Final
//
//  Created by Leah on 8/8/20.
//  Copyright © 2020 Leah Kvares. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    
    @IBAction func completeTapped(_ sender: Any) {
        
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = selectedToDo.name
    }
    
    var previousVC = ToDoTableViewController()
    var selectedToDo = ToDo()

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
