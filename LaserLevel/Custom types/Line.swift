//  Created by Pavel Trusov on 26.10.2022.

import CoreGraphics
import UIKit

struct Line {
    var startX = CGFloat(0)
    var startY = CGFloat(0)
    var endX = CGFloat(0)
    var endY = CGFloat(0)
    
    var bezierLine: UIBezierPath {
        let linesPath = UIBezierPath()
        linesPath.move   (to: CGPoint(x: startX, y: startY))
        linesPath.addLine(to: CGPoint(x: endX,   y: endY))
        return linesPath
    }

    let layer = LineLayer()
}


extension Comparable {
    ///  Clamp value between min and max
    /// - Parameters:
    ///   - a: min
    ///   - b :   max
    /// - Returns: Clamped value
    func clamp(_ a: Self, _ b: Self)  ->  Self {
        var c = self
        if c < a { c = a }
        if c > b { c = b }
        return c
    }
}
