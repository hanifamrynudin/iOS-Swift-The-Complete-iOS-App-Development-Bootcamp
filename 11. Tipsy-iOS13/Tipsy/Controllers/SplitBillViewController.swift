//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class SplitBillViewController: UIViewController {

    @IBOutlet weak var billLabel: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var tip0Button: UIButton!
    @IBOutlet weak var tip10Button: UIButton!
    @IBOutlet weak var tip20Button: UIButton!
    
    var selectedTip: Float?
    let formatter = NumberFormatter()
    var splitBillBrain = SplitBillBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func tipButtonPressed(_ sender: UIButton) {
        tip0Button.isSelected = false
        tip10Button.isSelected = false
        tip20Button.isSelected = false
        
        if sender.currentTitle == tip0Button.currentTitle {
            tip0Button.isSelected = true
            let tipToFloat  = Float(tip0Button.currentTitle!)
            selectedTip = tipToFloat ?? 0.0
        } else if sender.currentTitle == tip10Button.currentTitle {
            tip10Button.isSelected = true
            let tipToFloat  = Float(tip10Button.currentTitle!)
            selectedTip = tipToFloat ?? 0.1
        } else {
            tip20Button.isSelected = true
            let tipToFloat  = Float(tip20Button.currentTitle!)
            selectedTip = tipToFloat ?? 0.2
        }
        
        billLabel.resignFirstResponder()
    }
    
    @IBAction func splitButtonPressed(_ sender: UIStepper) {
        splitLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        let bill = Float(truncating: formatter.number(from: billLabel.text!) ?? 0.0)
        let split = Float(splitLabel.text!) ?? 0.0
        
        splitBillBrain.calculateBill(bill: bill, tip: selectedTip ?? 0.0, split: split)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = String(format: "%.0f",  splitBillBrain.getSplitBillResult())
            destinationVC.tip = String(format: "%.0f",  splitBillBrain.getTip())
            destinationVC.split = String(format: "%.0f",  splitBillBrain.getSplit())
        }
    }
    
}

