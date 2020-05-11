//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Ashley Connor on 30/04/2020.
//  Copyright © 2020 Rublix. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!

    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()


    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }

    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateCelsiusLabel()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = getRandomColor()
    }

    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }

    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

        if string.isEmpty {
            return true
        }

        var allowedCharacterSet = CharacterSet.decimalDigits
            allowedCharacterSet.formUnion(CharacterSet.controlCharacters)
            allowedCharacterSet.insert(charactersIn: ".")

        let containsDisallowedCharacter =
            string.rangeOfCharacter(from: allowedCharacterSet)

        print("Contains disallowed character \(String(describing: containsDisallowedCharacter))")
        print("Current text: \(String(describing: textField.text))")
        print("Replacement text: \(string)")

        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")

        if (existingTextHasDecimalSeparator != nil &&
            replacementTextHasDecimalSeparator != nil) ||
            containsDisallowedCharacter == nil {
            return false
        }

        return true
    }

    func getRandomColor() -> UIColor {
        let red: CGFloat = CGFloat(drand48())
        let green: CGFloat = CGFloat(drand48())
        let blue: CGFloat = CGFloat(drand48())

        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

