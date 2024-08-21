//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import LocationEditor
import SwiftUI
import SwiftUIIntrospect

public struct BarcodeEdit: View {
    public typealias ResultAction = (Code?) -> Void
    private let action: ResultAction

    @State private var code: Code
    @State private var isLocationEditorShowing = false
    @State private var isDateEditorShowing = false

    public init(
        name: String,
        value: CodeValue,
        location: Location?,
        action: @escaping ResultAction
    ) {
        self.code = Code(name: name, value: value, location: location)
        self.action = action
    }

    public init(value: CodeValue, action: @escaping ResultAction) {
        self.init(name: "", value: value, location: nil, action: action)
    }

    public init(code: Code, action: @escaping ResultAction) {
        self.init(name: code.name, value: code.value, location: nil, action: action)
    }

    public var body: some View {
        List {
            Section {
                BarcodePreview(value: code.value)
                    .listRowBackground(EmptyView())
                    .listRowSeparator(.hidden, edges: .all)
                    .introspect(.listCell, on: .iOS(.v17, .v18)) { cell in
                        cell.clipsToBounds = false
                    }
            }

            Section {
                TextField(BarcodeEditStrings.BarcodeEdit.nameFieldPlaceholder, text: $code.name)
            }

            BarcodeTriggersSection(
                selectedLocation: code.location,
                isLocationEditorShowing: $isLocationEditorShowing,
                isDateEditorShowing: $isDateEditorShowing
            )
        }
        .listStyle(.grouped)
        .scrollContentBackground(.hidden)
        .background(BarcodeEditBackground())
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            DoneButton { action(code) }
            CancelButton { action(nil) }
        }
        .sheet(isPresented: $isLocationEditorShowing) {
            LocationEditor(wheresMyTaco: $code.location)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    BarcodeEdit(name: "Code", value: .qr(value: "https://cocoatype.com", correctionLevel: .m), location: nil) { _ in }
}
