//  Created by Pavel Trusov on 26.10.2022.

import UIKit

extension ViewController {
    func startDrawing () -> Void {
        Timer.scheduledTimer(withTimeInterval: refreshRate, repeats: true) {_ in
            self.drawLines()
        }
    }
    
    func drawLines() -> Void {
        // Gyro data
        updateGravityData()
        
        // Gyro data projection on a vertical plane
        var angle = -(atan2(gyroData.x, gyroData.y) - .pi)
        
        // Rotate on pi/2 if Landscape
        switch UIDevice.current.orientation {
        case .landscapeLeft, .landscapeRight: angle -= .pi / 2
        default: break
        }
        
        // Static coordinates
        // (Horizontal line is always from the left edge to the right,
        // vertical - from the top to the bottom)
        horizontal.startX = 0
        horizontal.endX = frame.width
        vertical.startY = 0
        vertical.endY = frame.height
        
        // Dynamic coordinates depending on the gyro data
        horizontal.startY = frame.height / 2 + (frame.width  / 2 * tan(angle))
        horizontal.endY   = frame.height / 2 - (frame.width  / 2 * tan(angle))
        vertical.startX   = frame.width  / 2 - (frame.height / 2 * tan(angle))
        vertical.endX     = frame.width  / 2 + (frame.height / 2 * tan(angle))
        
        // User's gesture correction
        vertical.startX += userShift.shiftX + userShift.cumulativeShiftX
        vertical.endX += userShift.shiftX + userShift.cumulativeShiftX
        
        horizontal.startY += userShift.shiftY + userShift.cumulativeShiftY
        horizontal.endY += userShift.shiftY + userShift.cumulativeShiftY
        
        // Lines drawing
        if let _ = previewLayer?.connection {
            for line in [horizontal, vertical] {
                line.layer.removeFromSuperlayer()
                line.layer.frame = previewLayer!.frame
                line.layer.path = line.bezierLine.cgPath
                view.layer.addSublayer(line.layer)
            }
        }
    }
}
