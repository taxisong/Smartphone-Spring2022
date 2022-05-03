//
//  ViewController.swift
//  Final
//
//  Created by 宋春雨 on 5/3/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtWeight: UITextField!
    
    @IBOutlet weak var txtFeet: UITextField!
    
    @IBOutlet weak var txtInches: UITextField!
    
    @IBOutlet weak var lblBMI: UILabel!
    
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateBMIAction(_ sender: Any) {
        guard let weight = Float(txtWeight.text!) else {return}
        guard let feet = Float(txtFeet.text!) else {return}
        guard let inches = Float(txtInches.text!) else {return}

        var HeightIn = inches + feet * 12
        var HeightSquare = HeightIn * HeightIn
        var BMI = weight / HeightSquare * 703

        lblBMI.text = "BMI: \(BMI)"
        
        
        if BMI < 18.5 {
            lblStatus.text = "Underweight"
        }
        else if BMI > 30 {
            lblStatus.text = "Obese"
        }
        else if BMI < 25 {
            lblStatus.text = "Healthy weight"
        }
        else {
            lblStatus.text = "Overweight"
        }
        
    }
    
}

