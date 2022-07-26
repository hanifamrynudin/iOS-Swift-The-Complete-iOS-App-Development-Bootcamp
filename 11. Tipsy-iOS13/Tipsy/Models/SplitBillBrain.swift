//
//  BillBrain.swift
//  Tipsy
//
//  Created by Hanif Fadillah Amrynudin on 26/07/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct SplitBillBrain {
    
    var billData: Bill?
    
    mutating func calculateBill(bill: Float, tip: Float, split: Float) {
        
        let tipCalc = bill * tip
        
        let calc = (bill + tipCalc)  / split
        
        billData = Bill(bill: bill, split: split, tip: tip, calc: calc)
        print(tip)
    }

    func getSplitBillResult() -> Float {
        return billData?.calc ?? 0.0
    }
    
    func getTip() -> Float {
        let tip = (billData?.tip ?? 0.0) * 100
        print(tip)
        return tip
    }
    
    func getSplit() -> Float {
        return billData?.split ?? 0.0
    }
}
