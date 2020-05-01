//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Ashley Connor on 30/04/2020.
//  Copyright © 2020 Rublix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [UIColor.red.cgColor,
                                UIColor.yellow.cgColor,
                                UIColor.green.cgColor,
                                UIColor.blue.cgColor]
             
        gradientLayer.transform = CATransform3DMakeRotation(CGFloat.pi, 0, 0, 1)
        gradientLayer.frame = view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

