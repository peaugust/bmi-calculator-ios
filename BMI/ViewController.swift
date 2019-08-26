//
//  ViewController.swift
//  BMI
//
//  Created by Pedro Freddi on 23/07/19.
//  Copyright © 2019 Pedro Freddi. All rights reserved.
//

import UIKit
import BubbleTransition

class ViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var heightInput: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    // MARK: - Properties
    let weightData: [Int] = Array(0...200)
    let weightPicker = UIPickerView()
    let heightMetersData: [Int] = Array(0...4)
    let heightCentimetersData: [Int] = Array(0...99)
    let heightPicker = UIPickerView()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPickers()
        setupButton()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
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
        presentResult(message: resultMessage, result: bmiResult)

    }
    
    func calcBMI(weight: Double, height: Double) -> Double {
        return weight / pow(height, 2.0)
    }
    
    func verifyBMI(_ bmi: Double) -> String {
        if bmi > 25 {
            return "You are overweight"
        } else if 18.5 ... 25 ~= bmi {
            return "Normal weight"
        } else {
            return "Underweight"
        }
    }
    
    // MARK: Navigation
    
    private func presentResult(message: String, result: Double) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let resultVC = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {
            return
        }
        resultVC.message = message
        resultVC.result = result
        self.present(resultVC, animated: true, completion: nil)
    }
    
    // MARK: Setup
    
    func setupButton () {
        calculateButton.layer.cornerRadius = 8
    }
    
    func setupPickers () {
        weightPicker.dataSource = self
        weightPicker.delegate = self
        weightInput.inputView = weightPicker
        heightPicker.dataSource = self
        heightPicker.delegate = self
        heightInput.inputView = heightPicker
    }
}

// MARK: UIPickerViewDataSource

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == heightPicker {
            return 2
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == heightPicker {
            if component == 0 {
                return heightMetersData.count
            }
            return heightCentimetersData.count
        }
        return weightData.count
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == heightPicker {
            if component == 0 {
                return "\(heightMetersData[row])"
            }
            return "\(heightCentimetersData[row])"
        }
        return "\(weightData[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == heightPicker {
            let selectedMetersRow = heightPicker.selectedRow(inComponent: 0)
            let selectedCentimetersRow = heightPicker.selectedRow(inComponent: 1)
            heightInput.text = "\(heightMetersData[selectedMetersRow]).\(heightCentimetersData[selectedCentimetersRow])"
        } else {
            weightInput.text = "\(weightData[row])"
        }
    }
}
