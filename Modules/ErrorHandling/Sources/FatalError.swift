//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Foundation

private var fatalErrorBehavior: (String, StaticString, UInt) -> Never = defaultFatalErrorBehavior
private let defaultFatalErrorBehavior = { Swift.fatalError($0, file: $1, line: $2) }

func overwriteFatalError(newBehavior: @escaping (String, StaticString, UInt) -> Never) { fatalErrorBehavior = newBehavior }
func restoreFatalError() { fatalErrorBehavior = defaultFatalErrorBehavior }

public func fatalError(_ message: String, file: StaticString = #fileID, line: UInt = #line) -> Never {
    fatalErrorBehavior(message, file, line)
}

public func fatalError(_ error: Error, file: StaticString = #fileID, line: UInt = #line) -> Never {
    ErrorHandling.fatalError(String(describing: error), file: file, line: line)
}

func hangForever() -> Never {
    repeat {
        RunLoop.current.run()
    } while (true)
}
