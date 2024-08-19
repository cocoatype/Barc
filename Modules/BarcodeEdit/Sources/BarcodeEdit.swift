//  Created by Geoff Pado on 8/16/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftUI
import SwiftUIIntrospect

public struct BarcodeEdit: View {
    public typealias ResultAction = (Code?) -> Void
    private let action: ResultAction

    @State private var name: String
    private let value: CodeValue

    public init(name: String, value: CodeValue, action: @escaping ResultAction) {
        self.name = name
        self.value = value
        self.action = action
    }

    public init(value: CodeValue, action: @escaping ResultAction) {
        self.init(name: "", value: value, action: action)
    }

    public init(code: Code, action: @escaping ResultAction) {
        self.init(name: code.name, value: code.value, action: action)
    }

    public var body: some View {
        List {
            Section {
                BarcodePreview(value: value)
                    .listRowBackground(EmptyView())
                    .listRowSeparator(.hidden, edges: .all)
                    .introspect(.listCell, on: .iOS(.v17, .v18)) { cell in
                        cell.clipsToBounds = false
                    }
            }

            Section {
                TextField("Name", text: $name)
            }
//            BarcodeTriggersSection()
        }
        .listStyle(.grouped)
        .scrollContentBackground(.hidden)
        .background(BarcodeEditBackground())
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            DoneButton { action(code) }
            CancelButton { action(nil) }
        }
        .navigationBarBackButtonHidden()
    }

    private var code: Code {
        Code(name: name, value: value, triggers: [])
    }
}

#Preview {
    BarcodeEdit(name: "Code", value: .qr(value: "https://cocoatype.com", correctionLevel: .m)) { _ in }
}
