//  Created by Pavel Trusov on 25.10.2022.

import UIKit
import AVFoundation

extension ViewController {
    func configureCaptureSession() {
        //MARK: - Capture session
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        currentDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: AVMediaType.video, position: .back)
           
        guard let captureDeviceInput = try? AVCaptureDeviceInput(device: currentDevice) else {
            return
        }
        
        captureSession.beginConfiguration()
        captureSession.addInput(captureDeviceInput)
        captureSession.commitConfiguration()
        captureSession.startRunning()
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        previewLayer?.frame = view.layer.frame

        view.layer.addSublayer(previewLayer!)
        
        //MARK: - Gestures
        /// Pan gesture that allows user to move lines on the screen
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.wasDragged(_:)))
        view.addGestureRecognizer(panGesture)
        
        /// Tap gesture to reset lines position to the center
        let tapGesture  = UITapGestureRecognizer(target: self, action: #selector(ViewController.wasTapped(_:)))
        view.addGestureRecognizer(tapGesture)
    }
}
