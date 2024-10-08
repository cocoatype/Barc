//  Created by Geoff Pado on 7/5/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import MessageUI
import SwiftUI

struct MailComposer: UIViewControllerRepresentable {
    @Environment(\.dismiss) private var dismiss
    static var canSendMail: Bool { MFMailComposeViewController.canSendMail() }

    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let controller = MFMailComposeViewController()
        controller.setToRecipients(["hello@cocoatype.com"])
        controller.mailComposeDelegate = context.coordinator
        return controller
    }

    func updateUIViewController(_ controller: MFMailComposeViewController, context: Context) {
        controller.mailComposeDelegate = context.coordinator
        context.coordinator.dismissAction = dismiss
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(dismissAction: dismiss)
    }

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        fileprivate var dismissAction: DismissAction

        init(dismissAction: DismissAction) {
            self.dismissAction = dismissAction
        }

        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: (any Error)?) {
            dismissAction()
        }
    }
}
