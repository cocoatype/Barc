//  Created by Geoff Pado on 5/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

public struct UnpurchasedFeature: Sendable {
    public static let unlimitedBarcodes = UnpurchasedFeature(
        message: Strings.UnlimitedBarcodes.message
    )

    public static let walletExport = UnpurchasedFeature(
        message: Strings.WalletExport.message
    )

    let message: String
    private init(message: String) {
        self.message = message
    }

    private typealias Strings = BarcUnpurchased.Strings.UnpurchasedFeature
}
