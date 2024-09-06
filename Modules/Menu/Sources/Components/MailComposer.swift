//  Created by Geoff Pado on 7/5/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import MessageUI
import SwiftUI

struct MailComposer: UIViewControllerRepresentable {
    static var canSendMail: Bool { MFMailComposeViewController.canSendMail() }

    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = MFMailComposeViewController()
        controller.setToRecipients(["hello@cocoatype.com"])
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
