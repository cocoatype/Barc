//  Created by Geoff Pado on 1/15/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

public struct PreviewErrorHandler: ErrorHandler {
    public init() {}

    public func log(_ error: any Error, module: StaticString, type: StaticString) {}
    
    public func fatalError(message: StaticString, file: StaticString, line: UInt) -> Never {
        Swift.fatalError("\(message)", file: file, line: line)
    }
}
