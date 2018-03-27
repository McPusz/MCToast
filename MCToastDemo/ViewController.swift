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
    private let toast = MCToast(text: "Hello")
    
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
        print("randomize")
    }
}

