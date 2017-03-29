//
//  ViewController.swift
//  ios-draw-rectangle
//
//  Created by pivotal on 3/28/17.
//  Copyright © 2017 pivotal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let triggerColor = UIColor.init(red: 1, green: 0.227451, blue: 0.188235, alpha: 1).cgColor
    @IBOutlet weak var BackgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // drawRect()
    }
    
    func drawRect(){
        let doYourPath = UIBezierPath(rect: CGRect(x: 0, y: 100, width: view.frame.width, height: 20))
        let layer = CAShapeLayer()
        layer.path = doYourPath.cgPath
        layer.strokeColor = UIColor.white.cgColor
        view.layer.addSublayer(layer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getPixelColorAtPoint(point:CGPoint) -> UIColor{
        
        let pixel = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: 4)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: pixel, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        
        context!.translateBy(x: -point.x, y: -point.y)
        BackgroundImage.layer.render(in: context!)
        let color:UIColor = UIColor(red: CGFloat(pixel[0])/255.0,
                                    green: CGFloat(pixel[1])/255.0,
                                    blue: CGFloat(pixel[2])/255.0,
                                    alpha: CGFloat(pixel[3])/255.0)
        
        pixel.deallocate(capacity: 4)
        return color
    }
    
    func drawDot(point: CGPoint){
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: point.x, y: point.y), radius: CGFloat(3), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        let pixelColor = getPixelColorAtPoint(point: point)

        print("\(pixelColor.cgColor.components![0]) - \(Double(triggerColor.components![0]))")
        
        var color = UIColor.blue.cgColor
        
        if (pixelColor.cgColor.components![0] == triggerColor.components![0]){
            color = UIColor.white.cgColor
        }
        shapeLayer.strokeColor = color
        
        view.layer.addSublayer(shapeLayer)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: view)
            drawDot(point: currentPoint)
        }
    }


}

