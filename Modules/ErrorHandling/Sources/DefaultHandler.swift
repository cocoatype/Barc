//  Created by Geoff Pado on 8/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Logging

struct DefaultHandler: ErrorHandler {
    private let logger: any Logger
    init(logger: any Logger = Logging.logger) {
        self.logger = logger
    }

    private let eventFactory = EventFactory()
    func log(_ error: any Error) {
        logger.log(eventFactory.event(from: error))
    }
    
    func fatalError(message: StaticString, file: StaticString, line: UInt) -> Never {
        // log a message, then
        Swift.fatalError(String(message), file: file, line: line)
    }
}

fileprivate extension String {
    init(_ staticString: StaticString) {
        let buffer = staticString.withUTF8Buffer { $0 }
        self.init(decoding: buffer, as: UTF8.self)
    }
}
