//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Hanif Fadillah Amrynudin on 26/07/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var result: String?
    var tip: String?
    var split: String?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = result
        descLabel.text = "Split between \(split ?? "0") people, with \(tip ?? "0")% tip."
    }
    
    @IBAction func recalculateButtonPressed(_ sender: Any) {
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
