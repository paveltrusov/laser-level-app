//  Created by Pavel Trusov on 25.10.2022.

import UIKit
import AVFoundation

extension ViewController {

    
    @objc func updateOrientation () -> Void {
        if let _ = self.previewLayer?.connection {
            super.viewDidLayoutSubviews()

            self.previewLayer?.connection?.videoOrientation = .portrait
            self.previewLayer?.frame = view.bounds
            
            frame.width = self.previewLayer!.frame.width
            frame.height = self.previewLayer!.frame.height
        }
    }
}
