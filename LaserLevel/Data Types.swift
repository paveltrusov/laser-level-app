//  Created by Pavel Trusov on 25.10.2022.

import UIKit
import CoreGraphics


/// Structure to store all data related to the line
struct Line {
    /// Line start X coordinate
    var startX = CGFloat(0)
    /// Line start Y coordinate
    var startY = CGFloat(0)
    /// Line end X coordinate
    var endX = CGFloat(0)
    /// Line end Y coordinate
    var endY = CGFloat(0)
    /// Bezier line from (startX, startY) to (endX, endY)
    var bezierLine: UIBezierPath {
        let linesPath = UIBezierPath()
        linesPath.move   (to: CGPoint(x: startX, y: startY))
        linesPath.addLine(to: CGPoint(x: endX,   y: endY))
        return linesPath
    }
    /// Custom CAShapelayer to draw red line
    let layer = LineLayer()
}

/// Custom CAShapelayer to draw red line with 3.0 width
final class LineLayer: CAShapeLayer {
    override func layoutSublayers() {
        self.strokeColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
        self.lineWidth = 3.0
    }
}

/// Structure to store lines shift data caused by user gestures
struct UserShift {
    /// Pan gesture start X coordinate
    var panStartX = CGFloat(0)
    /// Pan gesture start Y coordinate
    var panStartY = CGFloat(0)
    
    /// Pan gesture distance on X axis
    var shiftX = CGFloat(0)
    /// Pan gesture distance on Y axis
    var shiftY = CGFloat(0)
    
    /// Total shift on X axis after multiple pan gestures
    var cumulativeShiftX = CGFloat(0)
    /// Total shift on Y axis after multiple pan gestures
    var cumulativeShiftY = CGFloat(0)
}

/// Frame size (just not to type "self.previewLayer!.frame" every time)
struct Frame {
    var width = CGFloat(0)
    var height = CGFloat(0)
}

/// 3 axis gyro data
struct Gyro {
    var x = 0.0
    var y = 0.0
    //var z = 0.0  // not used in the app yet
}
