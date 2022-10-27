//  Created by Pavel Trusov on 25.10.2022.

import UIKit
import AVFoundation

extension ViewController {
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        detectOrientation()
    }
    
    /// Detects physical device orientation (not interface orientation)
    ///
    /// Call updatePreviewLayer method to update camera preview layer orientation according to device orientation
    @objc func detectOrientation () -> Void {
        if let connection = self.previewLayer?.connection {
            let currentDevice = UIDevice.current
            let orientation = currentDevice.orientation
            let previewLayerConnection: AVCaptureConnection = connection
            
            
            if previewLayerConnection.isVideoOrientationSupported {
                switch orientation {
                case .portrait:
                    self.updatePreviewLayer(layer: previewLayerConnection, orientation: .portrait)
                case .landscapeRight:
                    self.updatePreviewLayer(layer: previewLayerConnection, orientation: .landscapeLeft)
                case .landscapeLeft:
                    self.updatePreviewLayer(layer: previewLayerConnection, orientation: .landscapeRight)
                case .portraitUpsideDown:
                    self.updatePreviewLayer(layer: previewLayerConnection, orientation: .portraitUpsideDown)
                default: self.updatePreviewLayer(layer: previewLayerConnection, orientation: .portrait)
                }
                frame.width = self.previewLayer!.frame.width
                frame.height = self.previewLayer!.frame.height
                
                self.previewLayer?.connection?.videoOrientation = .portrait

            }
        }
    }
    
    /// Updates camera preview layer orientation according to device orientation
    func updatePreviewLayer(layer: AVCaptureConnection, orientation: AVCaptureVideoOrientation) -> Void {
        layer.videoOrientation = orientation
        self.previewLayer?.frame = view.bounds
    }
    
    /// Reset lines to the center on interface rotation
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        userShift.cumulativeShiftX = 0
        userShift.cumulativeShiftY = 0
    }
}
