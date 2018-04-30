//
//  Extensions.swift
//  WeatherApp
//
//  Created by Nuri Chun on 4/28/18.
//  Copyright © 2018 tetra. All rights reserved.
//

import UIKit

extension UIView
{
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, topPad: CGFloat, leftPad: CGFloat, bottomPad: CGFloat, rightPad: CGFloat, width: CGFloat, height: CGFloat)
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top
        {
            self.topAnchor.constraint(equalTo: top, constant: topPad).isActive = true
        }
        
        if let left = left
        {
            self.leftAnchor.constraint(equalTo: left, constant: leftPad).isActive = true
        }
        
        if let bottom = bottom
        {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -bottomPad).isActive = true
        }
        
        if let right = right
        {
            self.rightAnchor.constraint(equalTo: right, constant: -rightPad).isActive = true
        }
        
        if width != 0
        {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0
        {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

extension UIColor
{
   static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor
    {
        return UIColor(displayP3Red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
}
