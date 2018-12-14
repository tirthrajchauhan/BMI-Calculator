//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Tirthrajsinh Chauhan on 2018-12-13.
//  Copyright © 2018 CentennialCollege. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{
    
    
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var Weight: UITextField!
    @IBOutlet weak var changemetric: UISwitch!
    @IBOutlet weak var Result: UILabel!
    var lastCalculationType: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func change(_ sender: UISegmentedControl) {
        
       
    }
    
    
    @IBAction func ChangeMetric(_ sender: UISwitch) {
        
        if sender.isOn{
            //If text is already there, convert it to metric
            if height.text != nil && !((height.text!).isEmpty) {
                if let heightVal = Double(height.text!) {
                    height.text = String(format: "%.2f", heightVal * 0.0254)
                }
            }
            if Weight.text != nil && !((Weight.text!).isEmpty) {
                if let weightVal = Double(Weight.text!) {
                    Weight.text = String(format: "%.2f", weightVal * 0.453592)
                }
            }
            if lastCalculationType == 1 && height.text != nil && !((height.text!).isEmpty) {
               
            }
            else if lastCalculationType == 0 && height.text != nil && !((height.text!).isEmpty) && Weight.text != nil && !((Weight.text!).isEmpty) {
               
            }
            height.placeholder = "Height(m)"
            Weight.placeholder = "Weight(kg)"
        }
        
        else {
            //If text is already there, convert it to imperial
            if height.text != nil && !((height.text!).isEmpty) {
                if let heightVal = Double(height.text!) {
                    height.text = String(format: "%.2f", heightVal / 0.0254)
                }
            }
            if Weight.text != nil && !((Weight.text!).isEmpty) {
                if let weightVal = Double(Weight.text!) {
                    Weight.text = String(format: "%.2f", weightVal / 0.453592)
                }
            }
            if lastCalculationType == 1 && height.text != nil && !((height.text!).isEmpty) {
                //calculateHealthyButton(nil)
            }
            else if lastCalculationType == 0 && height.text != nil && !((height.text!).isEmpty) && Weight.text != nil && !((Weight.text!).isEmpty) {
                //calculateButton(nil)
            }
            height.placeholder = "Height(in)"
            Weight.placeholder = "Weight(lbs)"
        }
        
        
        
        
    }
    


}

