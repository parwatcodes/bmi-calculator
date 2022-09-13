//
//  BMIResultController.swift
//  BMI Calculator
//
//  Created by Parwat Kunwar on 2022-09-13.
//

import Foundation
import UIKit

class BMIResultController: UIViewController {
    var height: String!
    var weight: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        let myHeight = Int(Double(height)!)
        let myWeight = Int(Double(weight)!);
        
        let myBMI = myWeight / (myHeight * myHeight);
        
        bmi.text = String(myBMI);
        getHealthCondition(myBMI);
    }
    
    @IBOutlet weak var bmi: UILabel!
    @IBOutlet weak var healthCondition: UILabel!
    
    func getHealthCondition(_ bmi: Int) {
        switch bmi {
        case 1..<15:
            healthCondition.text = "Very severly underweight";
        case 15...16:
            healthCondition.text = "Severly underweight";
        case 16..<Int(18.5):
            healthCondition.text = "Underweight";
        case Int(18.5)..<25:
            healthCondition.text = "Normal";
        case 25..<30:
            healthCondition.text = "Overweight";
        case 30..<35:
            healthCondition.text = "Moderately obese";
        case 35..<40:
            healthCondition.text = "Severly obese";
        case 40..<60:
            healthCondition.text = "Very severly obese";
        default:
            return;
        }
    }
    
    @IBAction func cance(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
