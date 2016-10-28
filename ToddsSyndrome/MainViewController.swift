//
//  ViewController.swift
//  ToddsSyndrome
//
//  Created by Andrew Garcia on 10/27/16.
//  Copyright © 2016 Andrew Garcia. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var migranesSegmentedControl: UISegmentedControl!
    @IBOutlet weak var hallucinogenicDrugsSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        addDoneButtonToKeyboard()
    }
    
    func addDoneButtonToKeyboard() {
        let toolbarDone = UIToolbar.init()
        toolbarDone.sizeToFit()
        let barBtnDone = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(MainViewController.ageTextDoneButtonPressed))
        toolbarDone.items = [barBtnDone]
        ageTextField.inputAccessoryView = toolbarDone
    }
    
    func ageTextDoneButtonPressed() {
        self.ageTextField.resignFirstResponder()
    }
    
    @IBAction func seeResultsPressed(_ sender: AnyObject) {
        // Need to make sure age is successfully entered, before moving on.
        // The rest have default values.
        
        if let ageEntered = Int(ageTextField.text!), ageEntered > 0 && ageEntered < 100 {
            performSegue(withIdentifier: "showResultsSegue", sender: nil)
        } else {
            // Not a valid age, present alert to enter a valid one.
            let alertController = UIAlertController(title: "Error!", message:
                "Please enter a valid age.", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResultsSegue" {
            let resultsVC = segue.destination as! ResultsViewController
            
            let age = Int(ageTextField.text!)
            let isMale = genderSegmentedControl.selectedSegmentIndex == 0
            let hasMigranes = migranesSegmentedControl.selectedSegmentIndex == 1
            let doesDrugs = hallucinogenicDrugsSegmentedControl.selectedSegmentIndex == 1
            
            resultsVC.results = TSCalc(age: age!, isMale: isMale, migranes: hasMigranes, hallucinogenicDrugs: doesDrugs)
        }
    }
}

