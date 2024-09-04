//  Created by Geoff Pado on 9/4/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

struct AdvanceAction {
    private let action: () -> Void
    init(action: @escaping () -> Void) {
        self.action = action
    }

    func callAsFunction() {
        action()
    }
}
