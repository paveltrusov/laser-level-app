//  Created by Pavel Trusov on 25.10.2022.

import UIKit
import AVFoundation
import CoreGraphics

class ViewController: UIViewController {
    
    var deviceOrientation: CustomOrientation = .none
    var currentDevice: AVCaptureDevice!
    var previewLayer: AVCaptureVideoPreviewLayer?
    let captureSession = AVCaptureSession()
    
    var horizontal = Line()
    var vertical = Line()
    
    var frameHeight = CGFloat(0)
    var frameWidth = CGFloat(0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.detectOrientation), name: UIDevice.orientationDidChangeNotification, object: nil)
        detectOrientation()
        configureCaptureSession()
        drawLines()
    }
}
