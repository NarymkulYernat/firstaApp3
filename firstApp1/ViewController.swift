//
//  ViewController.swift
//  firstApp1
//
//  Created by Ернат on 31.05.2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var texfield: UITextField!
    @IBOutlet weak var texfield2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.texfield.delegate = self
        self.texfield2.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    @IBAction func touched(_ sender: Any) {
        guard let a = texfield.text, let b = texfield2.text, !a.isEmpty, !b.isEmpty else {
            label.text = "Please enter both numbers"
            return
        }
        
        guard let numA = Int64(a), let numB = Int64(b) else {
            label.text = "Please enter valid numbers"
            return
        }
        
        let sum = numA + numB
        label.text = String(format: "sum = %lld", sum)
    }
}

