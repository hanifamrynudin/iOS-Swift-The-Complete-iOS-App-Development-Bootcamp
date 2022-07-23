//
//  calculatorBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Hanif Fadillah Amrynudin on 23/07/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        let bmiAdvice: String
        let bmiColor: UIColor
        
        if bmiValue < 18.5 {
            bmiAdvice = "underweight"
            bmiColor = UIColor.yellow
        } else if bmiValue > 18.5 && bmiValue < 24.9 {
            bmiAdvice = "normal"
            bmiColor = UIColor.green
        } else {
            bmiAdvice = "overweight"
            bmiColor = UIColor.red
        }
        
        bmi = BMI(value: bmiValue, advice: bmiAdvice, color: bmiColor)
    }
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getBMIAdvice() -> String {
        let bmiSendAdvice = bmi?.advice ?? "BMI Uncalculated"
        return bmiSendAdvice
    }
    
    func getBMIColor() -> UIColor {
        let bmiSendUIColor = bmi?.color ?? UIColor.orange
        return bmiSendUIColor
    }
    
}
