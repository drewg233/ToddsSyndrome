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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
