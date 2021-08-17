//
//  ViewController.swift
//  Prework
//
//  Created by Mitchell Wagner on 8/16/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipControl: UISlider!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipControl.value = 18.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        billAmountTextField.becomeFirstResponder()
    }
    
    func calculateTip() {
        print(tipControl.value)
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tipPercentage = Int(tipControl.value)
        let tip = bill * (Double(tipPercentage) / 100)
        
        let total = bill + tip
        
        tipPercentageLabel.text = String(Int(tipPercentage)) + "%"
        tipAmountLabel.text = String(format: "(%.2f)", tip)
        totalLabel.text = String(format: "%.2f", total)
    }

    @IBAction func tipControlChanged(_ sender: Any) {
        calculateTip()
    }
    
    @IBAction func billTotalEditingChanged(_ sender: Any) {
        calculateTip()
    }
}

