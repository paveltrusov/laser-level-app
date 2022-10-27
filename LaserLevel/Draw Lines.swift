//  Created by Pavel Trusov on 26.10.2022.

import UIKit

extension ViewController {
    func drawLines () -> Void {
        Timer.scheduledTimer(withTimeInterval: refreshRate, repeats: true) {_ in
            // Gyro data
            self.getGravityData()
            
            // Gyro data projection on vertical plane
            var angle = -(atan2(x, y) - .pi)
            
            // Rotate on -pi/2 if Landscape
            switch self.deviceOrientation {
            case .left, .right: angle -= .pi / 2
            default: break
            }

            // Static coordinates
            self.horizontal.startX = 0
            self.horizontal.endX = self.frameWidth
            self.vertical.startY = 0
            self.vertical.endY = self.frameHeight
            
            // Dynamic coordinates
            self.horizontal.startY = self.frameHeight / 2 + (self.frameWidth  / 2 * tan(angle))
            self.horizontal.endY   = self.frameHeight / 2 - (self.frameWidth  / 2 * tan(angle))
            self.vertical.startX   = self.frameWidth  / 2 - (self.frameHeight / 2 * tan(angle))
            self.vertical.endX     = self.frameWidth  / 2 + (self.frameHeight / 2 * tan(angle))
            
            // User's gesture correction
            self.vertical.startX += shiftX + cumulativeShiftX
            self.vertical.endX += shiftX + cumulativeShiftX
            
            self.horizontal.startY += shiftY + cumulativeShiftY
            self.horizontal.endY += shiftY + cumulativeShiftY
            
            // Lines drawing
            if let _ = self.previewLayer?.connection {
                for line in [self.horizontal, self.vertical] {
                    line.layer.removeFromSuperlayer()
                    line.layer.frame = self.previewLayer!.frame
                    line.layer.path = line.bezierLine.cgPath
                    self.view.layer.addSublayer(line.layer)
                }
            }
        }
    }
}
