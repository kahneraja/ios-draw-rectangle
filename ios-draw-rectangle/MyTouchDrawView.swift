//
//  MyTouchDrawView.swift
//  ios-draw-rectangle
//
//  Created by pivotal on 3/28/17.
//  Copyright © 2017 pivotal. All rights reserved.
//

import UIKit

class MyTouchDrawView: UIImageView {
    
    func drawDot(point: CGPoint){
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: point.x, y: point.y), radius: CGFloat(3), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        var color = UIColor.blue.cgColor
        if (point.y < 100 || point.y > 120){
            color = UIColor.red.cgColor
        }
        shapeLayer.strokeColor = color
        
        self.layer.addSublayer(shapeLayer)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let doYourPath = UIBezierPath(rect: CGRect(x: 0, y: 100, width: self.frame.width, height: 20))
        let layer = CAShapeLayer()
        layer.path = doYourPath.cgPath
        layer.strokeColor = UIColor.white.cgColor
        self.layer.addSublayer(layer)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: self)
            drawDot(point: currentPoint)
        }
    }
    

}
