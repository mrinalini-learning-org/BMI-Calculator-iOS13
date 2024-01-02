//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by Mrinalini Upadhya on 1/1/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmi: BMI?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = String(format: "%.1f", bmi?.value ?? 0.0)
        adviceLabel.text = bmi?.advice
        
        // change the color of the view background
        view.backgroundColor = bmi?.color
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
   

}
