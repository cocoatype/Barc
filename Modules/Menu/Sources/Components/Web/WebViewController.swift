//  Created by Geoff Pado on 5/11/19.
//  Copyright © 2019 Cocoatype, LLC. All rights reserved.

import SafariServices

public class WebViewController: SFSafariViewController {
    public init(url: URL) {
        let configuration = SFSafariViewController.Configuration()
        super.init(url: url, configuration: configuration)

        modalPresentationStyle = .currentContext
    }
}
