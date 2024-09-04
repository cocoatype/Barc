//  Created by Geoff Pado on 9/4/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

enum OnboardingPage {
    case intro
    case add
    case tag
    case `import`
    case view

    var next: OnboardingPage? {
        switch self {
        case .intro: .add
        case .add: .tag
        case .tag: .import
        case .import: .view
        case .view: .none
        }
    }
}
