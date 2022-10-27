//  Created by Pavel Trusov on 25.10.2022.

import UIKit

class LineLayer: CAShapeLayer {
    override func layoutSublayers() {
        self.strokeColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
        self.lineWidth = 3.0
    }
}
