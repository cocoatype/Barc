//  Created by Geoff Pado on 8/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcLogging

struct DefaultHandler: ErrorHandler {
    private let logger: any Logger
    init(logger: any Logger) {
        self.logger = logger
    }

    private let eventFactory = EventFactory()
    func log(_ error: any Error, module: StaticString, type: StaticString) {
        logger.log(eventFactory.event(from: error, module: module, type: type))
    }
    
    func fatalError(message: StaticString, file: StaticString, line: UInt) -> Never {
        // log a message, then
        Swift.fatalError(String(message), file: file, line: line)
    }
}
