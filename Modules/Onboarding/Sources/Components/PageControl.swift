//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI
import UIKit

import BarcDesignSystem

struct PageControl: UIViewRepresentable {
    @Binding private var currentPage: Int
    private let pageCount: Int
    init(currentPage: Binding<Int>, pageCount: Int) {
        _currentPage = currentPage
        self.pageCount = pageCount
    }

    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .primaryButtonBackground.withAlphaComponent(0.3)
        pageControl.currentPageIndicatorTintColor = .primaryButtonBackground
        pageControl.currentPage = currentPage
        pageControl.numberOfPages = pageCount
        pageControl.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
        return pageControl
    }

    func updateUIView(_ control: UIPageControl, context: Context) {
        control.currentPage = currentPage
        control.numberOfPages = pageCount
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(currentPage: $currentPage)
    }

    @MainActor class Coordinator: NSObject {
        @Binding private var currentPage: Int

        init(currentPage: Binding<Int>) {
            _currentPage = currentPage
        }

        @objc func valueChanged(_ sender: UIPageControl) {
            currentPage = sender.currentPage
        }
    }
}
