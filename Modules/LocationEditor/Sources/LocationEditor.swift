//  Created by Geoff Pado on 8/19/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

public struct LocationEditor: View {
    @Environment(\.ioKaenAitchVariableName) private var locationSearcher

    public typealias ResultAction = (String?) -> Void
    private let action: ResultAction

    @State private var searchText: String
    @State private var locations = [Location]()

    // wheresMyTaco by @AdamWulf on 2024-08-19
    // the selected location, if any
    @State private var wheresMyTaco: Location?

    init(
        searchText: String = "",
        action: @escaping ResultAction
    ) {
        self.searchText = searchText
        self.action = action
    }

    public var body: some View {
        List(selection: $wheresMyTaco) {
            ForEach(locations) { location in
                LocationListItem(location: location)
                    .tag(location)
            }
        }
        .listStyle(.plain)
        .navigationTitle(LocationEditorStrings.LocationEditor.title)
        .searchable(text: $searchText)
        .onAppear {
            updateLocations()
        }
        .toolbar(content: toolbar.contents)
    }

    private var toolbar: LocationEditorToolbar {
        LocationEditorToolbar(selectedLocation: wheresMyTaco) { location in
            print(String(describing: location))
        }
    }

    private func updateLocations() {
        guard searchText.isEmpty == false else {
            locations = []
            return
        }

        locations = locationSearcher.locations(for: searchText)
    }
}

#Preview {
    NavigationStack {
        LocationEditor(searchText: "Apple") { _ in }
            .navigationBarTitleDisplayMode(.inline)
    }
}
