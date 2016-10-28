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
    @IBOutlet weak var resultsLabelCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var resultsTextLabelLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var controlsStackViewBottomConstraint: NSLayoutConstraint!
    
    var results: TSCalc?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Load views off the screen
        resultsLabelCenterConstraint.constant = -500
        resultsTextLabelLeftConstraint.constant = -1500
        controlsStackViewBottomConstraint.constant = -50
        self.view.layoutIfNeeded()
        
        loadScreen()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Load in animations
        UIView.animate(withDuration: 1.0, delay: 0.5, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.2, options: [], animations: {
                self.resultsLabelCenterConstraint.constant = 0
                self.resultsTextLabelLeftConstraint.constant = 0
                self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 4.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.2, options: [], animations: {
                self.controlsStackViewBottomConstraint.constant += 60
                self.view.layoutIfNeeded()
            }, completion: nil)
    }
    
    func loadScreen() {
        // Add the text with the results data
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
    
    @IBAction func shareButtonPressed(_ sender: AnyObject) {
        // Text to share
        let text = results?.getShareResultText()
        
        // Set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        // Present the view controller
        self.present(activityViewController, animated: true, completion: nil)
    }
}
