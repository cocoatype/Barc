//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import DesignSystem
import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    private let currentPage: Int
    private let pageCount: Int
    init(currentPage: Int, pageCount: Int) {
        self.currentPage = currentPage
        self.pageCount = pageCount
    }

    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = DesignSystemAsset.primaryButtonBackground.color.withAlphaComponent(0.3)
        pageControl.currentPageIndicatorTintColor = DesignSystemAsset.primaryButtonBackground.color
        pageControl.currentPage = currentPage
        pageControl.numberOfPages = pageCount
        return pageControl
    }

    func updateUIView(_ control: UIPageControl, context: Context) {
        control.currentPage = currentPage
        control.numberOfPages = pageCount
    }
}
