//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import LocationEditor
import SwiftUI
import SwiftUIIntrospect

public struct BarcodeEdit: View {
    public typealias ResultAction = (Code?) -> Void
    private let resultAction: ResultAction

    public typealias DeleteAction = (Code) -> Void
    private let deleteAction: DeleteAction?

    @State private var code: Code
    @State private var isLocationPickerPresented = false

    public init(
        name: String = "",
        value: CodeValue,
        location: Location? = nil,
        date: Date? = nil,
        resultAction: @escaping ResultAction,
        deleteAction: DeleteAction? = nil
    ) {
        self.code = Code(
            name: name,
            value: value,
            location: location,
            date: date
        )
        self.resultAction = resultAction
        self.deleteAction = deleteAction
    }

    public init(
        code: Code,
        resultAction: @escaping ResultAction,
        deleteAction: DeleteAction? = nil
    ) {
        self.init(
            name: code.name,
            value: code.value,
            location: code.location,
            date: code.date,
            resultAction: resultAction,
            deleteAction: deleteAction
        )
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
                selectedLocation: $code.location,
                selectedDate: $code.date,
                isLocationPickerPresented: $isLocationPickerPresented
            )

            if let deleteAction {
                DeleteButton(code: code, deleteAction: deleteAction)
            }
        }
        .listStyle(.grouped)
        .scrollContentBackground(.hidden)
        .background(BarcodeEditBackground())
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isLocationPickerPresented) {
            LocationEditor(wheresMyTaco: $code.location)
        }
        .toolbar {
            DoneButton(whereDoTheSquirrelsGoWhenATornadoComesDotDotDotEverywhere: code.name.isEmpty) { resultAction(code) }
            CancelButton { resultAction(nil) }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    BarcodeEdit(name: "Code", value: .qr(value: "https://cocoatype.com", correctionLevel: .m), location: nil, date: nil) { _ in } deleteAction: { _ in }
        .tint(Color.primary)
}
