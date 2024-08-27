//  Created by Geoff Pado on 8/26/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI
import UIKit

class ShareViewController: UIHostingController<AnyView> {
    @objc init(nibName: String?, bundle: Bundle?) {
        super.init(rootView: AnyView(ShareView()))
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        let typeName = NSStringFromClass(type(of: self))
        fatalError("\(typeName) does not implement init(coder:)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let newRoot = ShareView()
            .environment(\.extensionContext, extensionContext)
        rootView = AnyView(newRoot)
    }
    //self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
}

public enum ExtensionContextEnvironmentKey: EnvironmentKey {
    public static let defaultValue: NSExtensionContext? = nil
}

public extension EnvironmentValues {
    var extensionContext: NSExtensionContext? {
        get { self[ExtensionContextEnvironmentKey.self] }
        set { self[ExtensionContextEnvironmentKey.self] = newValue }
    }
}
