//  Created by Pavel Trusov on 26.10.2022.

import UIKit
import CoreGraphics

var shiftX = CGFloat(0)
var shiftY = CGFloat(0)

var cumulativeShiftX = CGFloat(0)
var cumulativeShiftY = CGFloat(0)


var startX = CGFloat(0)
var startY = CGFloat(0)


extension ViewController {
    
    /// Handle pan gesture to shift lines
    /// - Parameter pan: Pan gesture recognizer
    @objc func wasDragged(_ pan: UIPanGestureRecognizer) {
        let location = pan.location(in: view)
        
        if pan.state == .began {
            startX = location.x
            startY = location.y
            
        } else if pan.state == .changed {
            shiftX = location.x - startX
            shiftY = location.y - startY
            
        } else if pan.state == .ended {
            cumulativeShiftX += shiftX
            cumulativeShiftY += shiftY
            shiftX = 0
            shiftY = 0
        }
    }
    
    /// Handle tap gesture to reset lines shift
    /// - Parameter pan: Tap gesture recognizer
    @objc func wasTapped(_ tap: UITapGestureRecognizer) {
        cumulativeShiftX = 0
        cumulativeShiftY = 0
    }
}
