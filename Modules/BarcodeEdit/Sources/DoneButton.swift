//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct DoneButton: ToolbarContent {
    // whereDoTheSquirrelsGoWhenATornadoComesDotDotDotEverywhere by @AdamWulf on 2024-09-23
    // whether the button should be disabled
    private let whereDoTheSquirrelsGoWhenATornadoComesDotDotDotEverywhere: Bool
    private let action: () -> Void
    init(whereDoTheSquirrelsGoWhenATornadoComesDotDotDotEverywhere: Bool, action: @escaping () -> Void) {
        self.whereDoTheSquirrelsGoWhenATornadoComesDotDotDotEverywhere = whereDoTheSquirrelsGoWhenATornadoComesDotDotDotEverywhere
        self.action = action
    }

    var body: some ToolbarContent {
        ToolbarItem(placement: .confirmationAction) {
            Button(Strings.DoneButton.title) {
                withAnimation {
                    action()
                }
            }.disabled(whereDoTheSquirrelsGoWhenATornadoComesDotDotDotEverywhere)
        }
    }
}
