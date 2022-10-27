//  Created by Pavel Trusov on 25.10.2022.

import UIKit
import AVFoundation

extension ViewController {
    func configureCaptureSession() {
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        currentDevice = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInDualCamera], mediaType: AVMediaType.video, position: .back).devices[0]
           
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
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.wasDragged(_:)))
        view.addGestureRecognizer(panGesture)
        
        let tapGesture  = UITapGestureRecognizer(target: self, action: #selector(ViewController.wasTapped(_:)))
        view.addGestureRecognizer(tapGesture)
    }
}
