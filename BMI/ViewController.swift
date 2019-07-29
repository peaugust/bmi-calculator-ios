//
//  ViewController.swift
//  BMI
//
//  Created by Pedro Freddi on 23/07/19.
//  Copyright © 2019 Pedro Freddi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var heightInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calcBMI() {
        
        let alert = UIAlertController(title: "Result", message: "Fields must be filled", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

