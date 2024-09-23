//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

extension Int {
    func binaryBoolValues(count: Int) -> [Bool] {
        var int = self
        var array = [Bool]()
        for _ in 0..<count {
            array.insert(int % 2 == 1, at: 0)
            int /= 2
        }
        return array
    }
}
