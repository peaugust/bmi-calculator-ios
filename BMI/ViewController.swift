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
    
    @IBAction func didTapBMIButton() {
        
        guard let weight = weightInput.text,
            let height = heightInput.text,
            let weightConverted = Double(weight),
            let heightConverted = Double(height) else {
                let alert = UIAlertController(title: "Result", message: "Fields must be filled", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                
                alert.addAction(action)
                
                present(alert, animated: true, completion: nil)
                return
        }
        
        let bmiResult = calcBMI(weight: weightConverted, height: heightConverted)
        let resultMessage = verifyBMI(bmiResult)
        
        let alert = UIAlertController(title: "\(resultMessage)", message: "Your BMI is \(bmiResult)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func calcBMI(weight: Double, height: Double) -> Double {
        return weight / pow(height, 2.0)
    }
    
    func verifyBMI(_ bmi: Double) -> String {
        if bmi > 25 {
            return "Overweight"
        } else if 18.5 ... 25 ~= bmi {
            return "Normal weight"
        } else {
            return "Underweight"
        }
    }
}

