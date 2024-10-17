//  Created by Geoff Pado on 10/8/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import CoreTransferable
import PassKit
import SwiftUI
import UniformTypeIdentifiers

struct WalletExportButton: View {
    private let code: Code
    init(code: Code) {
        self.code = code
    }

    var body: some View {
        Button("Add to Apple Wallet…", systemImage: "wallet.pass") {
            Task {
                let (data, _) = try await URLSession.shared.data(from: URL(string: "https://pass.getbarc.app/generate")!)
                let pass = try PKPass(data: data)
                let status = await PKPassLibrary().addPasses([pass])
                switch status {
                case .didAddPasses:
                    print("did add passes")
                case .shouldReviewPasses:
                    print("should review passes")
                case .didCancelAddPasses:
                    print("did cancel")
                }
            }
        }
    }
}

//struct WalletPass: Transferable {
//    static var transferRepresentation: some TransferRepresentation {
//        DataRepresentation(exportedContentType: UTType("com.apple.pkpass-data")!) { pass in
//            let (data, _) = try await URLSession.shared.data(from: URL(string: "https://pass.getbarc.app/generate")!)
//            return data
//        }
//    }
//}
