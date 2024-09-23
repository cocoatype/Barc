//  Created by Geoff Pado on 9/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import ImageReader
import SwiftUI

@main
struct CodeScannerApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                Rectangle()
                Text("Hello, world!")
            }
                .dropDestination(for: Data.self) { items, location in
                    guard let imageData = items.first else { fatalError("No data") }
                    let image = CGImage.image(from: imageData)
                    Task {
                        do {
                            try await dump(reader.codeValue(in: image))
                        } catch {
                            print(String(describing: error))
                        }
                    }

                    return true
                }
        }
    }

    private let reader = ImageReader()
}

extension CGImage {
    static func image(from data: Data) -> CGImage {
        if let dataProvider = CGDataProvider(data: data as CFData),
           let imageSource = CGImageSourceCreateWithDataProvider(dataProvider, nil),
           let cgImage = CGImageSourceCreateImageAtIndex(imageSource, 0, nil) {
            return cgImage
        } else { fatalError("Not an image") }
    }
}
