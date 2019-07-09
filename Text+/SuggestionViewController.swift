//
//  SuggestionViewController.swift
//  Text+
//
//  Created by Sai Kambampati on 6/14/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import NaturalLanguage

class SuggestionViewController: UIViewController {
    @IBOutlet var suggestButton: UIButton!
    @IBOutlet var itemTextField: UITextField!
    @IBOutlet var suggestionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func suggest(_ sender: Any) {
        suggestionLabel.text = "You may be interested in:\n"
        let embedding = NLEmbedding.wordEmbedding(for: .english)
        embedding?.enumerateNeighbors(for: itemTextField.text!.lowercased(), maximumCount: 5) { (string, distance) -> Bool in
            print("\(string) - \(distance)")
            suggestionLabel.text! += (string.capitalized + "\n")
            return true
        }
    }
}
