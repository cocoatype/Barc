//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public protocol Trigger: Hashable, Sendable {}

struct LocationTrigger: Trigger {}
struct DateTrigger: Trigger {}
