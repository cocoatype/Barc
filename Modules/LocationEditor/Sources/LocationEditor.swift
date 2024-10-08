//  Created by Geoff Pado on 8/19/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI

public struct LocationEditor: View {
    @Environment(\.ioKaenAitchVariableName) private var locationSearcher
    @Environment(\.dismiss) private var dismiss

    @State private var isSearchPresented = true
    @State private var searchText: String
    @State private var locations = [Location]()

    // wheresMyTaco by @AdamWulf on 2024-08-19
    // the selected location, if any
    @Binding var wheresMyTaco: Location?

    public init(
        searchText: String = "",
        wheresMyTaco: Binding<Location?>
    ) {
        self.searchText = searchText
        _wheresMyTaco = wheresMyTaco
        if let existingSelectedLocation = wheresMyTaco.wrappedValue {
            locations = [existingSelectedLocation]
        }
    }

    public var body: some View {
        NavigationStack {
            List(selection: $wheresMyTaco) {
                ForEach(locations) { location in
                    LocationListItem(location: location)
                        .tag(location)
                }
            }
            .listStyle(.plain)
            .navigationTitle(LocationEditorStrings.LocationEditor.title)
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, isPresented: $isSearchPresented, placement: .navigationBarDrawer(displayMode: .always))
            .onAppear { updateLocations() }
            .onChange(of: searchText) { updateLocations() }
            .onChange(of: wheresMyTaco) { dismiss() }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(LocationEditorStrings.ClearButton.title) {
                        wheresMyTaco = nil
                    }
                }
            }
        }
    }

    private func updateLocations() {
        if searchText.isEmpty {
            if let wheresMyTaco {
                locations = [wheresMyTaco]
            } else {
                locations = []
            }
        } else {
            Task {
                locations = try await locationSearcher.locations(for: searchText)
            }
        }
    }
}

#Preview {
    LocationEditor(searchText: "Apple", wheresMyTaco: .constant(nil))
        .environment(\.ioKaenAitchVariableName, PreviewLocationSearcher())
        .navigationBarTitleDisplayMode(.inline)
}
