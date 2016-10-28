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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func seeResultsPressed(_ sender: AnyObject) {
        // Need to make sure age is successfully entered, before moving on.
        // The rest have default values.
        
        if let ageEntered = Int(ageTextField.text!), ageEntered > 0 {
            performSegue(withIdentifier: "showResultsSegue", sender: nil)
        } else {
            // Not a valid age. Present alert.
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
            let isMale = genderSegmentedControl.isEnabledForSegment(at: 0)
            let hasMigranes = migranesSegmentedControl.isEnabledForSegment(at: 1)
            let doesDrugs = hallucinogenicDrugsSegmentedControl.isEnabledForSegment(at: 1)
            
            resultsVC.results = TSCalc().chanceOfToddsSyndrome(age: age!, isMale: isMale, migranes: hasMigranes, hallucinogenicDrugs: doesDrugs)
        }
    }
}

