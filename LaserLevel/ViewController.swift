//  Created by Pavel Trusov on 25.10.2022.

import UIKit
import AVFoundation
import CoreGraphics
import CoreMotion

class ViewController: UIViewController {
    
    var currentDevice: AVCaptureDevice!
    var previewLayer: AVCaptureVideoPreviewLayer?
    let captureSession = AVCaptureSession()
    
    /// Motion manager
    let manager = CMMotionManager()
    let refreshRate = Double (1 / 50)  // 50 Hz
    
    ///3 axis gyroscope data
    var gyroData = Gyro()
   
    /// Width and height of a frame (equal to self.previewLayer!.frame)
    var frame = Frame()
    
    /// Horizontal red line on a screen
    var horizontal = Line()
    /// Vertical  red line on a screen
    var vertical = Line()
    
    /// XY values of lines shift caused by user gestures
    var userShift = UserShift()

    // Force portrait mode
    override var shouldAutorotate: Bool {
        return false
    }
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateOrientation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCaptureSession()
        startDrawing()
    }
}
