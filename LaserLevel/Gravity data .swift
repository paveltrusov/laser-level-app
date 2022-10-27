//  Created by Pavel Trusov on 25.10.2022.

import CoreMotion

let manager = CMMotionManager()
let refreshRate = Double (1 / 10)  // 10 Hz

var x = 0.0
var y = 0.0

extension ViewController {
    func getGravityData() -> Void {
        manager.deviceMotionUpdateInterval = refreshRate
        manager.startDeviceMotionUpdates()
        
        if let data = manager.deviceMotion {
            x = data.gravity.x
            y = data.gravity.y
        }
    }
}
