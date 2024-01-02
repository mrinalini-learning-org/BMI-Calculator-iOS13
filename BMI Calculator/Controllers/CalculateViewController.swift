//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightValue: UILabel!
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    var calculatorBrain = CalculatorBrain()
    let goToResultSegue = "goToResult"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightSliderChange(_ sender: UISlider) {
        heightValue.text = String(format: "%.2fm", sender.value)
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        weightValue.text = String(format: "%.1fKg", sender.value)
        
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculatorBrain.calculateBmi(height: height, weight: weight)
        /* this is what brings up ResultViewController. A segue is created between Calculate and Result View Controllers
         
         Open the Main view inside Views folder and click the arrow between the two screens. That segue is named goToResult
         */
    
        self.performSegue(withIdentifier: goToResultSegue, sender: self)
    }
    
    // this is the method that gets called when performSegue is called inside calculatePressed function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == goToResultSegue {
            /* forced downcast, ! is what is forcing the downcast and making destinationVC of type ResultViewController
             */
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmi = calculatorBrain.bmi
            
        }
    }
}

