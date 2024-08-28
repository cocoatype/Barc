//  Created by Geoff Pado on 8/27/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import DesignSystem
import ErrorHandling
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
                errorHandler.log(error, module: "com.cocoatype.Barc.Share", type: "ShareView")
            }
    }

    private var title: String {
        guard let shareError = error as? ShareError else { return Strings.genericErrorTitle }

        switch shareError {
        case .noCodeInImage:
            return Strings.noCodeTitle
        case .cannotCreateImageFromData, .cannotLoadData, .noExtensionContext, .noImageProviders, .noInputProviders:
            return Strings.genericErrorTitle
        }
    }

    private var message: String {
        guard let shareError = error as? ShareError else { return Strings.genericErrorMessage }

        switch shareError {
        case .noCodeInImage:
            return Strings.noCodeMessage
        case .cannotCreateImageFromData, .cannotLoadData, .noExtensionContext, .noImageProviders, .noInputProviders:
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
