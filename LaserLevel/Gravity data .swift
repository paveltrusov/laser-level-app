//  Created by Pavel Trusov on 25.10.2022.

import CoreMotion

extension ViewController {
    
    ///  Updates data from built-in device  gyroscope
    func updateGravityData() -> Void {
        manager.deviceMotionUpdateInterval = refreshRate
        manager.startDeviceMotionUpdates()
        
        if let data = manager.deviceMotion {
            gyroData.x = data.gravity.x
            gyroData.y = data.gravity.y
            // Z axis is not used in the app
        }
    }
}
