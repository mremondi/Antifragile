//
//  UIViewConvenience.swift
//  Antifragile
//
//  Created by Michael Remondi on 9/20/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit
// autolayout methods
public extension UIView{
    public func fillSuperview() {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    public func anchorSize(to view: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    public func anchorCenter(to parent: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: parent.centerYAnchor).isActive = true
    }
    
    public func anchorCenterY(to parent: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: parent.centerYAnchor).isActive = true
    }
    
    public func anchorCenterX(to parent: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
    }
    
    public func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?,
                       bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?,
                       padding: UIEdgeInsets = .zero, size: CGSize = .zero){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}

public extension UIView {
    
    // OUTPUT 1
    func dropShadow(masksToBounds: Bool = false, scale: Bool = true, shadowOpacity: Float = 0.2, width: Int = -1, height: Int = 1, radius: CGFloat = 1) {
        print(masksToBounds)
        layer.masksToBounds = masksToBounds
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = CGSize(width: width, height: height)
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

public extension UIView {
    public func pin(to view: UIView) {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}


// Rounded Corners
@IBDesignable public extension UIView {
    public func roundCornersToRadius(masksToBounds: Bool = true, _ radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = masksToBounds
    }
    
    @IBInspectable public var radius: CGFloat {
        get {
            return 0
        }
        set {
            roundCornersToRadius(CGFloat(newValue))
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat {
        get {
            return 0
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable public var borderColor: UIColor {
        get {
            return UIColor.white
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
}
