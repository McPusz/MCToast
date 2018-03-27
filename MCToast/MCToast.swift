//
//  MCToast.swift
//  MCToast
//
//  Created by Mpalka on 21.03.2018.
//  Copyright © 2018 McPusz. All rights reserved.
//

import Foundation

open class MCToast {
    
    public var text: String? {
        get { return self.view.text }
        set { self.view.text = newValue }
    }
    
    open var view: MCToastView = MCToastView()
    private let animationDuration = 0.3
    
    public init(text: String?) {
        self.text = text
        self.show()
    }

    open func show() {
        let appDelegate = UIApplication.shared.delegate
        let rootView = appDelegate?.window??.rootViewController?.view
        rootView?.addSubview(view)
        
        UIView.animate(withDuration: self.animationDuration, delay: 0, options: .curveEaseIn, animations: {
            self.view.frame.origin.y += self.view.bounds.height
        }, completion: nil)
    }
    
    open func hide() {
        UIView.animate(withDuration: self.animationDuration, delay: 0, options: .curveEaseIn, animations: {
            self.view.frame.origin.y += self.view.frame.height
        }, completion: { [weak self] _ in
            self?.view.removeFromSuperview()
        })
    }
}
