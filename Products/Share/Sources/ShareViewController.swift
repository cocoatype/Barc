//  Created by Geoff Pado on 8/26/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI
import UIKit

import BarcErrorHandling
import BarcShareContents

class ShareViewController: UIHostingController<AnyView> {
    @objc init(nibName: String?, bundle: Bundle?) {
        super.init(rootView: AnyView(ShareView(errorHandler: ErrorHandling.defaultHandler)))
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        let typeName = NSStringFromClass(type(of: self))
        fatalError("\(typeName) does not implement init(coder:)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let newRoot = ShareView(errorHandler: ErrorHandling.defaultHandler)
            .environment(\.extensionContext, extensionContext)
        rootView = AnyView(newRoot)
    }
}
