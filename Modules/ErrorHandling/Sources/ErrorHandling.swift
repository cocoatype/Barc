//  Created by Geoff Pado on 8/23/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcLogging

public enum ErrorHandling {
    @available(*, deprecated, renamed: "defaultHandler(logger:)")
    public static let deprecatedHandler: any ErrorHandler = DefaultHandler(logger: Logging.logger)

    public static func defaultHandler(logger: any Logger) -> any ErrorHandler {
        DefaultHandler(logger: logger)
    }
}
