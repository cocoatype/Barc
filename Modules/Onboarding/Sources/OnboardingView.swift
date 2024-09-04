//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

public struct OnboardingView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var currentPage = OnboardingPage.intro

    public init() {}

    public var body: some View {
        Group {
            switch currentPage {
            case .intro: IntroPage()
            case .add: AddPage()
            case .tag: TagPage()
            case .import: ImportPage()
            case .view: ViewPage()
            }
        }.environment(\.advance, AdvanceAction {
            guard let nextPage = currentPage.next else { return dismiss() }
            currentPage = nextPage
        })
    }
}

#Preview {
    OnboardingView()
}
