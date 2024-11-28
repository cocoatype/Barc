//  Created by Geoff Pado on 10/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

enum PassRequestError: Error, CustomLocalizedStringResourceConvertible {
    case unrepresentableMessage

    typealias StringResources = WalletExportStringResources.PassRequestError
    var localizedStringResource: LocalizedStringResource {
        switch self {
        case .unrepresentableMessage: StringResources.unrepresentableMessage
        }
    }
}
