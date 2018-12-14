//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Tirthrajsinh Chauhan on 2018-12-13.
//  Copyright © 2018 CentennialCollege. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController ,UITextFieldDelegate{
    
    
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var Weight: UITextField!
    @IBOutlet weak var changemetric: UISwitch!
    @IBOutlet weak var Result: UILabel!
    var lastCalculationType: Int?
    
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var name: UITextField!
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    @IBAction func CalculateBMI(_ sender: UIButton) {
        
        if Weight.text != nil && height.text != nil, var weight = Double(Weight.text!), var height = Double(height.text!) {
            self.view.endEditing(true)
            //Calculating BMI using metric, so convert to metric first
            if !changemetric.isOn {
                (weight) *= 0.453592;
                (height) *= 0.0254;
            }
            let _name = name.text!
            let _lastname = lastname.text!
            let BMI: Double = weight / (height * height)
            let shortBMI = String(format: "%.2f", BMI)
            var resultText = "\(_name) \(_lastname) BMI is \(shortBMI): "
            var descriptor : String?
            if(BMI < 16.0) { descriptor = "Severely Thin" }
            else if(BMI < 16.99) { descriptor = "Moderately Thin" }
            else if(BMI < 18.49) { descriptor = "Slightly Thin" }
            else if(BMI < 24.99) { descriptor = "Normal" }
            else if(BMI < 29.99) { descriptor = "Overweight" }
            else if(BMI < 34.99) { descriptor = "Moderately Obese" }
            else if(BMI < 39.99) { descriptor = "Severely Obese" }
            else { descriptor = "Very Severely Obese" }
            resultText += descriptor!
            print(resultText)
            Result.text = resultText
            Result.isHidden = false
            lastCalculationType = 0
            
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "Entity", into: context)
            newUser.setValue(self.name!.text, forKey: "name")
            newUser.setValue(shortBMI, forKey: "bmi")
            
            do{
                try context.save()}
            catch{
                print(error)
            }
        }
        else {
            Result.text = "Please fill out your height and weight."
            Result.isHidden = false
            lastCalculationType = 0
        }
    }
    
    
    
    
    
    


}

