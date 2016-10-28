//
//  ResultsViewController.swift
//  ToddsSyndrome
//
//  Created by Andrew Garcia on 10/27/16.
//  Copyright © 2016 Andrew Garcia. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var resultsTextLabel: UILabel!
    
    var results: TSCalc?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadScreen()
    }
    
    func loadScreen() {
        if let chanceOfToddsSyndrome = results?.chanceOfToddsSyndrome() {
            resultsLabel.text = "\(chanceOfToddsSyndrome)%"
            if let resultsText = results?.getResultText() {
                resultsTextLabel.text = "Results are in and you are \(chanceOfToddsSyndrome)% likely to have Todd's Syndrome. \(resultsText)"
            }
        }
    }

    @IBAction func homeButtonPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }


}
