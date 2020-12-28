//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by Failyn Kaye M. Sedik on 12/23/20.
//

import UIKit

final class CustomTabBar: UITabBar {
    
    // MARK: - Properties
    
    private var shapeLayer: CAShapeLayer?
    
    // MARK: - Overriden Methods
    
    override func draw(_ rect: CGRect) {
        let shapeLayer: CAShapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1.0
        
        // As per tutorial, replacing the sublayer if it already exists
        // supports orientation changes.
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
    }
    
    /// "To avoid the TabBar receiving touch events by clicking the button in the lower areas,
    /// we need to override the point-inside method of the TabBar and return false if the
    /// button was clicked."
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let buttonRadius: CGFloat = 35
        return abs(self.center.x - point.x) > buttonRadius ||
                abs(point.y) > buttonRadius
    }
    
}

// MARK: - Private APIs

extension CustomTabBar {
    
    /// Creates the path for the custom tab bar's shape. It begins from
    /// drawing a line from the top left to the beginning of the indentation.
    /// Then, connect the missing corners of the `UIBezierPath`.
    private func createPath() -> CGPath {
        let height: CGFloat = 37.0
        let path: UIBezierPath = UIBezierPath()
        let centerWidth: CGFloat = self.frame.width / 2
        
        // Start from the top-left
        path.move(to: CGPoint(x: 0, y: 0))
        
        // The beginning of the trough
        path.addLine(
            to: CGPoint(
                x: centerWidth - height * 2,
                y: 0
            )
        )
        
        // First curve down
        path.addCurve(
            to: CGPoint(x: centerWidth, y: height),
            controlPoint1: CGPoint(x: centerWidth - 30, y: 0),
            controlPoint2: CGPoint(x: centerWidth - 35, y: height)
        )
        
        // Second curve up
        path.addCurve(
            to: CGPoint(x: centerWidth + height * 2, y: 0),
            controlPoint1: CGPoint(x: centerWidth + 35, y: height),
            controlPoint2: CGPoint(x: centerWidth + 30, y: 0)
        )
        
        // Complete the rect
        path.addLine(to: CGPoint(x: frame.width, y: 0))
        path.addLine(to: CGPoint(x: frame.width, y: frame.height))
        path.addLine(to: CGPoint(x: 0, y: frame.height))
        
        path.close()
        
        return path.cgPath
    }
    
}
