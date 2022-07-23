//
//  ResultViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Hanif Fadillah Amrynudin on 22/07/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var bmiValue: String?
    var bmiAdvice: String?
    var bmiColor: UIColor?

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet var backgroundColor: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bmiLabel.text = bmiValue
        adviceLabel.text = bmiAdvice
        backgroundColor.backgroundColor = bmiColor
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
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
