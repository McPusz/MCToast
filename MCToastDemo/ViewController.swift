//
//  ViewController.swift
//  MCToastDemo
//
//  Created by Mpalka on 27.03.2018.
//  Copyright © 2018 McPusz. All rights reserved.
//

import UIKit
import MCToast

class ViewController: UIViewController {
    
    private let toastButton = UIButton()
    private let hideButton = UIButton()
    private let appearanceButton = UIButton()
    private let toast = MCToast(text: "Hello, you fool, I love you")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupButtons()
        self.addButtonActions()
    }
    
    private func setupButtons() {
        
        //SHOW BUTTON
        toastButton.setTitle("Show", for: .normal)
        toastButton.backgroundColor = .red
        self.view.addSubview(toastButton)
        toastButton.translatesAutoresizingMaskIntoConstraints = false
        
        // HIDE BUTTON
        hideButton.setTitle("Hide", for: .normal)
        hideButton.backgroundColor = .green
        self.view.addSubview(hideButton)
        hideButton.translatesAutoresizingMaskIntoConstraints = false
        
        //APPEARANCE BUTTON
        appearanceButton.setTitle("Randomize appearance", for: .normal)
        appearanceButton.backgroundColor = .purple
        self.view.addSubview(appearanceButton)
        appearanceButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Constraints
        let margin: CGFloat = 15
        let height: CGFloat = 30
        
        [toastButton, hideButton, appearanceButton].forEach { (button) in
            
            [button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
             button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
             button.heightAnchor.constraint(equalToConstant: height)
                ].forEach { $0.isActive = true }
            
        }
        
        [toastButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 2*margin),
        hideButton.topAnchor.constraint(equalTo: toastButton.bottomAnchor, constant: 2*margin),
        appearanceButton.topAnchor.constraint(equalTo: hideButton.bottomAnchor, constant: 2*margin)
            ].forEach { $0.isActive = true }
    }
    
    private func addButtonActions() {
        self.toastButton.addTarget(self, action: #selector(showToast), for: .touchUpInside)
        self.hideButton.addTarget(self, action: #selector(hideToast), for: .touchUpInside)
        self.appearanceButton.addTarget(self, action: #selector(randomizeToast), for: .touchUpInside)
    }
    
    @objc
    private func showToast() {
        toast.show()
    }
    
    @objc
    private func hideToast() {
        toast.hide()
    }
    
    @objc
    private func randomizeToast() {
        //BackgroundColor
        let colorList = [
        UIColor(red:0.31, green:0.32, blue:0.31, alpha:1.0),
        UIColor(red:0.95, green:0.37, blue:0.36, alpha:1.0),
        UIColor(red:1.00, green:0.88, blue:0.40, alpha:1.0),
        UIColor(red:0.14, green:0.48, blue:0.63, alpha:1.0),
        UIColor(red:0.44, green:0.76, blue:0.70, alpha:1.0)
        ]
        toast.view.baseColor = randomFrom(list: colorList)
        
        //CornerRadius between 0 and circle (toastHeight/2)
        let maxRadius = Int(toast.view.bounds.height/2)
        let randomCornerRadius = Int(arc4random_uniform(UInt32(maxRadius)))
        toast.view.cornerRadius = CGFloat(randomCornerRadius)
        
        //TextColor
        let textColors = [
            .white,
            UIColor(red:0.52, green:0.86, blue:0.78, alpha:1.0),
            UIColor(red:0.65, green:1.00, blue:0.84, alpha:1.0),
            UIColor(red:1.00, green:0.65, blue:0.62, alpha:1.0),
            UIColor(red:1.00, green:0.41, blue:0.42, alpha:1.0)
        ]
        toast.view.textColor = randomFrom(list: textColors)
        
        toast.show()
    }
    
    private func randomFrom<T>(list: [T]) -> T {
        let randomIndex = Int(arc4random_uniform(UInt32(list.count)))
        return list[randomIndex]
    }
}

