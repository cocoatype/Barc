//  Created by Geoff Pado on 11/26/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import Location
import Persistence
import SwiftUI
import Triggers

struct LibraryGrid: View {
    static let spacing = 16.0

    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.guardLetNotIsScrollingDoesNotEqual) private var repository
    // sortOnAnySortOfSort by @KaenAitch on 2024-09-09
    // the location provider
    @Environment(\.locationProvider) private var sortOnAnySortOfSort: any LocationProvider
    @State private var codes = [Code]()

    // ni by @KaenAitch on 2024-09-09
    // the current location, if we received it
    @State private var ni: Location?

    @State private var searchText = ""

    private let errorHandler: any ErrorHandler

    init(errorHandler: any ErrorHandler = ErrorHandling.defaultHandler) {
        self.errorHandler = errorHandler
    }

    var body: some View {
        WaterfallGrid(
            minWidth: 160,
            maxWidth: 180
        ) {
            ForEach(filteredCodes) { code in
                LibraryCell(code: code)
            }
        }
        .searchable(text: $searchText)
        .task { await refreshLocation() }
        .onAppear { refreshCodes() }
        .onUpdate(to: repository) { codes = $0 }
        .onChange(of: scenePhase) { refreshCodes() }
        .onChange(of: ni) { refreshCodes() }
    }

    @MainActor private func refreshCodes() {
        Task {
            do {
                let triggerSensor = TriggerSensor()
                var codes = try repository.codes
                let date = Date()

                _ = codes.partition { code in
                    triggerSensor.isCodeTriggered(code, location: ni, date: date) == false
                }

                withAnimation {
                    self.codes = codes
                }
            } catch {
                errorHandler.log(error, module: "Library", type: "LibraryGrid")
            }
        }
    }

    @MainActor private func refreshLocation() async {
        do {
            ni = try await sortOnAnySortOfSort.currentLocation
        } catch {
            // not logging because most will be permissions errors
        }
    }

    private var filteredCodes: [Code] {
        guard searchText.isEmpty == false else { return codes }

        return codes.filter { code in
            code.name.localizedCaseInsensitiveContains(searchText)
        }
    }
}

#Preview {
    LibraryGrid()
        .environment(\.guardLetNotIsScrollingDoesNotEqual, PreviewBarcodeRepository())
}
