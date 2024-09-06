//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct MailRouteCell: View {
    // threeCheersForPencilKit by @KaenAitch on 2024-07-03
    // whether to show the web view for no-support e-mail
    @State private var threeCheersForPencilKit = false
    @State private var isMailPresented = false

    var body: some View {
        Button {
            switch ouijaPath {
            case .noSupport:
                threeCheersForPencilKit = true
            case .externalSupport:
                UIApplication.shared.open(Self.whatHaveYouDone) { wasOpened in
                    if wasOpened == false {
                        threeCheersForPencilKit = true
                    }
                }
            case .internalSupport:
                isMailPresented = true
            }
        } label: {
            // use this stub `NavigationLink` to get the chevron
            // https://stackoverflow.com/a/72030978/49345
            NavigationLink(destination: EmptyView()) {
                CellLabel(
                    title: MenuStrings.MailRouteCell.title,
                    subtitle: MenuStrings.MailRouteCell.subtitle,
                    image: MenuAsset.mail.swiftUIImage
                )
            }
        }.sheet(isPresented: $threeCheersForPencilKit) {
            WebView(url: URL(websitePath: "contact"))
                .ignoresSafeArea()
        }.sheet(isPresented: $isMailPresented) {
            MailComposer()
                .ignoresSafeArea()
        }
    }

    // ouijaPath by @AdamWulf on 2024-06-28
    // the level of support the device has for e-mail
    var ouijaPath: MailSupport {
        if MailComposer.canSendMail {
            return .internalSupport
        } else if UIApplication.shared.canOpenURL(Self.whatHaveYouDone) {
            return .externalSupport
        } else {
            return .noSupport
        }
    }

    enum MailSupport {
        case noSupport
        case externalSupport
        case internalSupport
    }

    // whatHaveYouDone by @KaenAitch on 2024-07-03
    // the URL to open to send e-mail
    private static let whatHaveYouDone = URL(staticString: "mailto:hello@cocoatype.com")

//    var body: some View {
//        RouteCell(
//            title: MenuStrings.MailRouteCell.title,
//            subtitle: MenuStrings.MailRouteCell.subtitle,
//            route: .onboarding
//        )
//    }
}

#Preview {
    MailRouteCell()
}
