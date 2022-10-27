//  Created by Pavel Trusov on 25.10.2022.

import UIKit
import AVFoundation

enum CustomOrientation {
    case up, down, left, right, none
}

extension ViewController {
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        detectOrientation()
    }
    
    @objc func detectOrientation () -> Void {
        if let connection = self.previewLayer?.connection {
            let currentDevice = UIDevice.current
            let orientation = currentDevice.orientation
            let previewLayerConnection: AVCaptureConnection = connection
            
            if previewLayerConnection.isVideoOrientationSupported {
                switch orientation {
                case .portrait:
                    self.updatePreviewLayer(layer: previewLayerConnection, orientation: .portrait)
                    deviceOrientation = .up
                    
                case .landscapeRight:
                    self.updatePreviewLayer(layer: previewLayerConnection, orientation: .landscapeLeft)
                    deviceOrientation = .left

                case .landscapeLeft:
                    self.updatePreviewLayer(layer: previewLayerConnection, orientation: .landscapeRight)
                    deviceOrientation = .right

                case .portraitUpsideDown:
                    self.updatePreviewLayer(layer: previewLayerConnection, orientation: .portraitUpsideDown)
                    deviceOrientation = .down

                default: self.updatePreviewLayer(layer: previewLayerConnection, orientation: .portrait)
                }
                frameWidth = self.previewLayer!.frame.width
                frameHeight = self.previewLayer!.frame.height
            }
        }
    }
    
    func updatePreviewLayer(layer: AVCaptureConnection, orientation: AVCaptureVideoOrientation) -> Void {
        layer.videoOrientation = orientation
        self.previewLayer?.frame = view.bounds
    
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        cumulativeShiftX = 0
        cumulativeShiftY = 0
    }
}
