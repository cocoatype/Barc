//  Created by Geoff Pado on 10/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import BarcErrorHandling
import PassKit
import SwiftUI

struct PassReviewViewModifier: ViewModifier {
    @State private var reviewPass: PKPass?
    @Binding private var pass: ExportedPass?
    @Binding private var error: Error?
    private let errorHandler: any ErrorHandler
    init(
        pass: Binding<ExportedPass?>,
        error: Binding<Error?>,
        errorHandler: any ErrorHandler
    ) {
        _pass = pass
        _error = error
        self.errorHandler = errorHandler
    }

    func body(content: Content) -> some View {
        content
            .onChange(of: pass) {
                if let pass {
                    do {
                        reviewPass = try PKPass(data: pass.data)
                    } catch {
                        self.error = error
                    }
                } else {
                    reviewPass = nil
                }
            }
            .sheet(item: $reviewPass) { pass in
                PassReviewView(pass: pass, errorHandler: errorHandler)
            }
    }
}

extension PKPass: Swift.Identifiable {}

extension View {
    func passReviewSheet(
        pass: Binding<ExportedPass?>,
        error: Binding<Error?>,
        errorHandler: any ErrorHandler
    ) -> some View {
        modifier(
            PassReviewViewModifier(
                pass: pass,
                error: error,
                errorHandler: errorHandler
            )
        )
    }
}
