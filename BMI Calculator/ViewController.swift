//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Parwat Kunwar on 2022-09-13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var height: UITextField!
    private var bmiResultController: BMIResultController!
    
    @IBAction func calculateBMI(_ sender: Any) {
        if (weight.text!.isEmpty && height.text!.isEmpty) {
            let err = "Please enter weight and height to calculate BMI";
            
            return showAlert(err);
        }
        
        if (weight.text!.isEmpty) {
            let err = "Please enter weight";
            
            return showAlert(err);
        }
        
        if (height.text!.isEmpty) {
            let err = "Please enter height";
            
            return showAlert(err);
        }
        
        if (Double(weight.text!) == nil || Double(height.text!) == nil) {
            let err = "Invalid input entered";
            
            return showAlert(err);
        }
        
        bmiResultController = storyboard?.instantiateViewController(withIdentifier: "BMIResultController") as? BMIResultController
        
        bmiResultController.modalPresentationStyle = .fullScreen
        bmiResultController.height = height.text;
        bmiResultController.weight = weight.text;
        
        
        self.present(bmiResultController, animated: true, completion: nil)
    }
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)

        return present(alert, animated: true, completion: nil)
    }
}

