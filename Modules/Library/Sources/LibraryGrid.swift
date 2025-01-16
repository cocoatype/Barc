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
    // sortOnAnySortOfSort by @KaenAitch on 2024-09-09
    // the location provider
    @Environment(\.locationProvider) private var sortOnAnySortOfSort: any LocationProvider
    @State private var codes: [Code]

    // ni by @KaenAitch on 2024-09-09
    // the current location, if we received it
    @State private var ni: Location?

    @State private var searchText = ""

    private let repository: any BarcodeRepository
    private let errorHandler: any ErrorHandler
    init(
        codes: [Code],
        repository: any BarcodeRepository,
        errorHandler: any ErrorHandler
    ) {
        _codes = State(initialValue: codes)
        self.repository = repository
        self.errorHandler = errorHandler
    }

    var body: some View {
        ScrollView {
            WaterfallGrid(
                minWidth: 160,
                maxWidth: 180
            ) {
                ForEach(filteredCodes) { code in
                    LibraryCell(code: code, repository: repository, errorHandler: errorHandler)
                }
            }
            .searchable(text: $searchText)
            .task { await refreshLocation() }
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

        let triggerSensor = TriggerSensor()
        let date = Date()

        let (partitionedCodes, _) = codes.partitioned { code in
            triggerSensor.isCodeTriggered(code, location: ni, date: date) == false
        }

        return partitionedCodes.filter { code in
            code.name.localizedCaseInsensitiveContains(searchText)
        }
    }
}

extension Array {
    public func partitioned(by belongsInSecondPartition: (Element) throws -> Bool) rethrows -> (Self, Int) {
        var copy = self
        let index = try copy.partition(by: belongsInSecondPartition)
        return (copy, index)
    }
}

#Preview {
    LibraryGrid(
        codes: PreviewBarcodeRepository.sampleCodes,
        repository: PreviewBarcodeRepository(),
        errorHandler: PreviewErrorHandler()
    )
}
