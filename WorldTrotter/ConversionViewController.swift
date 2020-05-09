//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Ashley Connor on 30/04/2020.
//  Copyright © 2020 Rublix. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    var degreesFahrenheit: UILabel!
    var fahrenheitDescription: UILabel!
    var isReallyLabel: UILabel!
    var degreesCelsius: UILabel!
    var celciusDescription: UILabel!
    
    override func loadView() {
        view = UIView()
        
        degreesFahrenheit = UILabel()
        degreesFahrenheit.text = "212"
        
        fahrenheitDescription = UILabel()
        fahrenheitDescription.text = "degrees fahrenheit"
        
        isReallyLabel = UILabel()
        isReallyLabel.text = "Is really"
        
        degreesCelsius = UILabel()
        degreesCelsius.text = "100"
        
        celciusDescription = UILabel()
        celciusDescription.text = "degrees celcius"
        
        let labels = [degreesFahrenheit, fahrenheitDescription, isReallyLabel, degreesCelsius, celciusDescription]
        
        for label in labels {
            label!.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(label!)
        }
        
        let margins = view.layoutMarginsGuide
        
        degreesFahrenheit.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        fahrenheitDescription.topAnchor.constraint(equalTo: degreesFahrenheit.bottomAnchor, constant: 100).isActive = true
        isReallyLabel.topAnchor.constraint(equalTo: fahrenheitDescription.bottomAnchor, constant: 100).isActive = true
        degreesCelsius.topAnchor.constraint(equalTo: isReallyLabel.bottomAnchor, constant: 100).isActive = true
        celciusDescription.topAnchor.constraint(equalTo: degreesCelsius.bottomAnchor, constant: 100).isActive = true
        
        for label in labels {
            label?.textAlignment = .center
            label?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            label?.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
            label?.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = getRandomColor()
    }
    
    func getRandomColor() -> UIColor {
        let red: CGFloat = CGFloat(drand48())
        let green: CGFloat = CGFloat(drand48())
        let blue: CGFloat = CGFloat(drand48())
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

