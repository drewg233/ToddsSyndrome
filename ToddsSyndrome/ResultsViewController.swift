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
    
    var results: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsLabel.text = "\(results)%"
    }

    @IBAction func homeButtonPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }


}
