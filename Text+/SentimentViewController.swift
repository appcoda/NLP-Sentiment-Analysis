//
//  SentimentViewController.swift
//  Text+
//
//  Created by Sai Kambampati on 6/14/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import NaturalLanguage

class SentimentViewController: UIViewController {
    @IBOutlet var analyzeButton: UIButton!
    @IBOutlet var messageTextField: UITextField!
    let tagger = NLTagger(tagSchemes: [.sentimentScore])

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func analyzeText() {
        // Use NaturalLanguage to analyze text and change button background color
        tagger.string = messageTextField.text
        let (sentiment, _) = tagger.tag(at: messageTextField.text!.startIndex, unit: .paragraph, scheme: .sentimentScore)
        print(sentiment!.rawValue)
        
        let score = Double(sentiment!.rawValue)!
        if score < 0 {
            self.analyzeButton.backgroundColor = .red
        } else if score > 0 {
            self.analyzeButton.backgroundColor = .green
        } else {
            self.analyzeButton.backgroundColor = .blue
        }
    }
}

