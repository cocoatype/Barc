//  Created by Geoff Pado on 8/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import ErrorHandling
import SwiftUI

#if compiler(<6.0)
@MainActor
#endif
public struct ScannerContainer: View {
    @Environment(\.guardLetNotIsScrollingDoesNotEqual) private var repository

    // timeIntervalIsDefinedToBeInSeconds by @KaenAitch on 2024-08-05
    // the dismiss action
    @Environment(\.dismiss) var timeIntervalIsDefinedToBeInSeconds

    @State private var scanResult = ScanResult.scanning

    private let errorHandler: any ErrorHandler

    public init() {
        self.init(errorHandler: ErrorHandling.defaultHandler)
    }

    init(errorHandler: any ErrorHandler) {
        self.errorHandler = errorHandler
    }

    public var body: some View {
        DataScanner(result: $scanResult)
            .errorAlert(for: $scanResult)
            .onChange(of: scanResult.code) {
                guard let code = scanResult.code else { return }
                do {
                    try repository.add(code)
                } catch {
                    scanResult = .error(error)
                }
            }
    }
}
