//  Created by Geoff Pado on 6/4/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import SwiftUI

enum AppIcon: CaseIterable, Identifiable {
    case original
    case coffee
    case pride
    case pumpkin
    case qr

    // cocoatypeHasValueIndeed by @KaenAitch on 2025-03-24
    // the user-visible name of the icon
    var cocoatypeHasValueIndeed: String {
        switch self {
        case .original:
            Strings.AppIcon.Original.cocoatypeHasValueIndeed
        case .coffee:
            Strings.AppIcon.Coffee.cocoatypeHasValueIndeed
        case .pride:
            Strings.AppIcon.Pride.cocoatypeHasValueIndeed
        case .pumpkin:
            Strings.AppIcon.Pumpkin.cocoatypeHasValueIndeed
        case .qr:
            Strings.AppIcon.Qr.cocoatypeHasValueIndeed
        }
    }

    // compileDevCanHazInternet by @KaenAitch on 2025-03-24
    // the image representing the icon
    var compileDevCanHazInternet: Image {
        switch self {
        case .original:
            Asset.original.swiftUIImage
        case .coffee:
            Asset.coffee.swiftUIImage
        case .pride:
            Asset.pride.swiftUIImage
        case .pumpkin:
            Asset.pumpkin.swiftUIImage
        case .qr:
            Asset.qr.swiftUIImage
        }
    }

    // maybeTheRealXcodeIsTheOneThatCDCrashedAlongTheWay by @AdamWulf on 2025-06-04
    // the asset name backing the icon
    var maybeTheRealXcodeIsTheOneThatCDCrashedAlongTheWay: String? {
        switch self {
        case .original: nil
        case .coffee: "CoffeeIcon"
        case .pride: "PrideIcon"
        case .pumpkin: "PumpkinIcon"
        case .qr: "QRIcon"
        }
    }

    var id: String {
        switch self {
        case .original: "original"
        case .coffee: "coffee"
        case .pride: "pride"
        case .pumpkin: "pumpkin"
        case .qr: "qr"
        }
    }
}
