//
//  ResultViewController.swift
//  BMI
//
//  Created by Pedro Freddi on 12/08/19.
//  Copyright © 2019 Pedro Freddi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultMessageLabel: UILabel!
    @IBOutlet weak var resultTextField: UITextField!
    @IBAction func didTapCalculateAgain(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    var message: String = ""
    var result: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultMessageLabel.text = message
        resultTextField.text = String(result)
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
