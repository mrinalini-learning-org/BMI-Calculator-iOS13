//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Mrinalini Upadhya on 1/1/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI? // notice how BMI is still not initialized at this point
    
    mutating func calculateBmi(height: Float, weight: Float) {
        let bmiVal = weight / pow(height, 2)
        // init bmi here
        bmi = getBmi(bmiVal)
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getBmi(_ bmiVal: Float) -> BMI {
        if (bmiVal < 18.5) {
            let blue = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) // type #colorLiteral()
            return BMI(value: bmiVal, advice: "Eat more pies.", color: blue)
        } else if (bmiVal <= 24.9) {
            let green = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            return BMI(value: bmiVal, advice: "Fit as a fiddle!", color: green)
        }
        let red = #colorLiteral(red: 1, green: 0.5647058824, blue: 0.737254902, alpha: 1)
        return BMI(value: bmiVal, advice: "Eat less pies.", color: red)

    }
}
