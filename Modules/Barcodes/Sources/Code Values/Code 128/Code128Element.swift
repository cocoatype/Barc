//  Created by Geoff Pado on 9/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public enum Code128Element: Identifiable, Sendable {
    case e00, e01, e02, e03, e04, e05, e06, e07, e08, e09, e0a, e0b, e0c, e0d, e0e, e0f
    case e10, e11, e12, e13, e14, e15, e16, e17, e18, e19, e1a, e1b, e1c, e1d, e1e, e1f
    case e20, e21, e22, e23, e24, e25, e26, e27, e28, e29, e2a, e2b, e2c, e2d, e2e, e2f
    case e30, e31, e32, e33, e34, e35, e36, e37, e38, e39, e3a, e3b, e3c, e3d, e3e, e3f
    case e40, e41, e42, e43, e44, e45, e46, e47, e48, e49, e4a, e4b, e4c, e4d, e4e, e4f
    case e50, e51, e52, e53, e54, e55, e56, e57, e58, e59, e5a, e5b, e5c, e5d, e5e, e5f
    case e60, e61, e62, e63, e64, e65, e66, e67, e68, e69, e6a

    public var id: UInt8 {
        Code128ElementToByteConverter().byte(for: self)
    }
}
