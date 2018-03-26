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
        set { self.textColor = newValue }
    }
    
    open var cornerRadius: CGFloat {
        get { return self.layer.cornerRadius }
        set { self.layer.cornerRadius = newValue }
    }

    //MARK: UIComponents
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
        super.layoutSubviews()
        let screenSize = UIScreen.main.bounds
        let widthMultiplier: CGFloat = 9/10
        let toastWidth: CGFloat = screenSize.width * widthMultiplier
        let toastHeight: CGFloat = CGFloat.greatestFiniteMagnitude
        
        let toastSize: CGSize = CGSize(
            width: toastWidth,
            height: toastHeight)
        
        let textFrame = self.textLabel.sizeThatFits(toastSize)
        
        self.textLabel.frame = CGRect(
            x: self.textInsets.left,
            y: self.textInsets.top,
            width: textFrame.width,
            height: textFrame.height)
        
        let totalFrame = CGRect(
            x: textInsets.left,
            y: textFrame.height + 2*textInsets.top,
            width: toastWidth,
            height: textFrame.height + 2*textInsets.top)
        
        self.frame = totalFrame
    }
}
