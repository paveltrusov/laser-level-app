//  Created by Pavel Trusov on 26.10.2022.

import UIKit
import CoreGraphics

extension ViewController {
    /// Handle pan gesture to shift lines
    /// - Parameter pan: Pan gesture recognizer
    @objc func wasDragged(_ pan: UIPanGestureRecognizer) {
        let location = pan.location(in: view)
        
        if pan.state == .began {
            userShift.panStartX = location.x
            userShift.panStartY = location.y
            
        } else if pan.state == .changed {
            userShift.shiftX = location.x - userShift.panStartX
            userShift.shiftY = location.y - userShift.panStartY
            
        } else if pan.state == .ended {
            userShift.cumulativeShiftX += userShift.shiftX
            userShift.cumulativeShiftY += userShift.shiftY
            userShift.shiftX = 0
            userShift.shiftY = 0
        }
    }
    
    /// Handle tap gesture to reset lines shifting
    /// - Parameter pan: Tap gesture recognizer
    @objc func wasTapped(_ tap: UITapGestureRecognizer) {
        userShift.cumulativeShiftX = 0
        userShift.cumulativeShiftY = 0
    }
}
