//  Created by Geoff Pado on 12/8/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import os.log

public func log(_ error: Error, subsystem: String, category: String) {
    os_log(.error, log: OSLog(subsystem: subsystem, category: category), "%@", String(describing: error))
}
