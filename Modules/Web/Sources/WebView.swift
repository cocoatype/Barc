//  Created by Geoff Pado on 5/30/21.
//  Copyright © 2021 Cocoatype, LLC. All rights reserved.

import SwiftUI

public struct WebView: UIViewControllerRepresentable {
    private let url: URL
    public init(url: URL) {
        self.url = url
    }

    public func makeUIViewController(context: Context) -> WebViewController {
        return WebViewController(url: url)
    }

    public func updateUIViewController(_ uiViewController: WebViewController, context: Context) {}
}
