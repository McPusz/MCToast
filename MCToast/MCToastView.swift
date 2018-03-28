//
//  MCToastView.swift
//  MCToast
//
//  Created by Mpalka on 21.03.2018.
//  Copyright © 2018 McPusz. All rights reserved.
//

import Foundation
import UIKit

open class MCToastView: UIView {
    
    //MARK: Properties
    open var text: String? {
        get { return self.textLabel.text }
        set { self.textLabel.text = newValue }
    }
    
    open var baseColor: UIColor? {
        get { return self.backgroundColor }
        set { self.backgroundColor = newValue }
    }
    
    open var textColor: UIColor {
        get { return self.textLabel.textColor }
        set { self.textLabel.textColor = newValue }
    }
    
    open var cornerRadius: CGFloat {
        get { return self.layer.cornerRadius }
        set { self.layer.cornerRadius = newValue }
    }


    private let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let textInsets: UIEdgeInsets = UIEdgeInsetsMake(8, 16, 8, 16)
    
    public init() {
        super.init(frame: .zero)
        self.addSubview(textLabel)
        self.baseColor = .red
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override func layoutSubviews() {
        self.setConstraints()
    }

    private func setConstraints() {
        let margin: CGFloat = 15
        let textInset: CGFloat = 6
        guard let superview = self.superview else { return }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: margin),
         self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -margin),
         self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -margin)
            ].forEach{ $0.isActive = true }
        
        [textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: textInset),
         textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -textInset),
         textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin),
         textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin)
            ].forEach { $0.isActive = true }
        
    }
}
