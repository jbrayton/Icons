//
//  JSBIconCell.swift
//  Icons
//
//  Created by John Brayton on 1/8/23.
//

import UIKit

class JSBIconCell : UICollectionViewCell {
    
    static let borderWidth = 3.0
    static let cornerRadiusMultiplier = CGFloat(2*0.2237)
    
    var iconVariation: JSBIconVariation?
    
    let highlightColor = UIColor.gray
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        if let iconVariation = self.iconVariation {
            
            var borderWidth = JSBIconCell.borderWidth
            
            let outerSquircleRect = self.bounds
            let outerSquircleBezierPath = UIBezierPath.JSB_superellipse(in: outerSquircleRect, cornerRadius: outerSquircleRect.size.width*JSBIconCell.cornerRadiusMultiplier)
            highlightColor.setFill()
            outerSquircleBezierPath.fill()

            iconVariation.backgroundColor.JSB_uiColor.setFill()
            if self.isSelected || self.isFocused {
                if UIDevice.current.userInterfaceIdiom == .pad {
                    borderWidth = 3 * borderWidth
                } else {
                    borderWidth = 2 * borderWidth
                }
            }
            let innerSquircleRect = CGRect(x: borderWidth, y: borderWidth, width: self.bounds.size.width - (2*borderWidth), height: self.bounds.size.width - (2*borderWidth))
            let innerSquicleBezierPath = UIBezierPath.JSB_superellipse(in: innerSquircleRect, cornerRadius: innerSquircleRect.size.width*JSBIconCell.cornerRadiusMultiplier)
            innerSquicleBezierPath.fill()
            
            let scale = (self.bounds.size.width - (2*JSBIconCell.borderWidth)) / 1024.0

            let context = UIGraphicsGetCurrentContext()!
            
            /// Group
            do {
                context.saveGState()
                context.translateBy(x: JSBIconCell.borderWidth, y: JSBIconCell.borderWidth)

                let bezierPath = UIBezierPath()
                bezierPath.move(to: CGPoint(x: 511.5*scale, y: 320*scale))
                bezierPath.addLine(to: CGPoint(x: 705*scale, y: 705*scale))
                bezierPath.addLine(to: CGPoint(x: 318*scale, y: 705*scale))
                bezierPath.addLine(to: CGPoint(x: 511.5*scale, y: 320*scale))
                bezierPath.close()
                bezierPath.usesEvenOddFillRule = true
                iconVariation.foregroundColor.JSB_uiColor.setFill()
                bezierPath.fill()

                context.restoreGState()
            }
        }
    }
    
}
