//  Created by Geoff Pado on 8/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public protocol ErrorHandler {
    func log(_ error: Error, module: StaticString, type: StaticString)
    func fatalError(message: StaticString, file: StaticString, line: UInt) -> Never
}

public extension ErrorHandler {
    func fatalError(_ message: StaticString, file: StaticString = #fileID, line: UInt = #line) -> Never {
        self.fatalError(message: message, file: file, line: line)
    }
}
