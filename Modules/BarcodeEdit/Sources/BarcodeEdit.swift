//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI
import SwiftUIIntrospect

import BarcBarcodes
import BarcLocationEditor

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
        locations: [Location] = [],
        dates: [Date] = [],
        resultAction: @escaping ResultAction,
        deleteAction: DeleteAction? = nil
    ) {
        self.code = Code(
            name: name,
            value: value,
            locations: locations,
            dates: dates
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
            locations: code.locations,
            dates: code.dates,
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
                TextField(Strings.BarcodeEdit.nameFieldPlaceholder, text: $code.name)
            }

            #warning("FIX ME: Re-add trigger section")
//            BarcodeTriggersSection(
//                selectedLocation: $code.locations.first,
//                selectedDate: $code.dates.first,
//                isLocationPickerPresented: $isLocationPickerPresented
//            )

            if let deleteAction {
                DeleteButton(code: code, deleteAction: deleteAction)
            }
        }
        .listStyle(.grouped)
        .scrollContentBackground(.hidden)
        .background(BarcodeEditBackground())
        .navigationBarTitleDisplayMode(.inline)
//        .sheet(isPresented: $isLocationPickerPresented) {
//            LocationEditor(wheresMyTaco: $code.locations.first)
//        }
        .toolbar {
            DoneButton(whereDoTheSquirrelsGoWhenATornadoComesDotDotDotEverywhere: code.name.isEmpty) { resultAction(code) }
            CancelButton { resultAction(nil) }
        }
        .navigationBarBackButtonHidden()
#warning("FIX ME: Re-add location editor")
    }
}

#Preview {
    BarcodeEdit(
        name: "Code",
        value: .qr(value: "https://cocoatype.com", correctionLevel: .m)
    ) { _ in } deleteAction: { _ in }
        .tint(Color.primary)
}
