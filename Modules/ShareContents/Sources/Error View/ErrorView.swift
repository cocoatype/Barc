//  Created by Geoff Pado on 8/27/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import DesignSystem
import ErrorHandling
import ImageReader
import SwiftUI

struct ErrorView: View {
    private let error: Error
    private let errorHandler: any ErrorHandler
    init(error: Error, errorHandler: any ErrorHandler = ErrorHandling.defaultHandler) {
        self.error = error
        self.errorHandler = errorHandler
    }

    var body: some View {
        Color.systemGroupedBackground
            .ignoresSafeArea()
            .overlay {
                VStack(spacing: 8) {
                    ErrorTitleText(title)
                    ErrorMessageText(message)
                }
                .frame(maxWidth: 300)
            }
            .onAppear {
                errorHandler.log(error, module: "Share", type: "ShareView")
            }
    }

    private var title: String {
        switch error {
        case ShareError.noCodeInImage:
            return Strings.noCodeTitle
        case ShareError.userIsNotUnleashed:
            return Strings.unpurchasedTitle
        case BarcodeResultMapperError.invalidSymbology:
            return Strings.invalidSymbologyTitle
        default:
            return Strings.genericErrorTitle
        }
    }

    private var message: String {
        switch error {
        case ShareError.noCodeInImage:
            return Strings.noCodeMessage
        case ShareError.userIsNotUnleashed:
            return Strings.unpurchasedMessage
        case BarcodeResultMapperError.invalidSymbology:
            return Strings.invalidSymbologyMessage
        default:
            return Strings.genericErrorMessage
        }
    }

    private typealias Strings = ShareContentsStrings.ErrorView
}

#Preview {
    VStack {
        ErrorView(error: ShareError.noCodeInImage)
        ErrorView(error: ShareError.noExtensionContext)
    }
}
