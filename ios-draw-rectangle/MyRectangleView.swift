//
//  MyRectangleView.swift
//  ios-draw-rectangle
//
//  Created by pivotal on 3/28/17.
//  Copyright © 2017 pivotal. All rights reserved.
//

import UIKit

class MyRectangleView: UIView {

    override func draw(_ rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        context?.move(to: CGPoint(x:100, y: 100))
        context?.addLine(to: CGPoint(x: 150, y: 150))
        context?.addLine(to: CGPoint(x: 100, y: 200))
        context?.addLine(to: CGPoint(x: 50, y: 150))
        context?.addLine(to: CGPoint(x: 100, y: 100))
        context?.strokePath()
    }

}
