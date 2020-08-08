//
//  ViewController.swift
//  hAPPing_Final
//
//  Created by Leah on 8/8/20.
//  Copyright © 2020 Leah Kvares. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapButton(_ sender: UIButton) {
        let vc = UIViewController()
        vc.view.backgroundColor = .black
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

