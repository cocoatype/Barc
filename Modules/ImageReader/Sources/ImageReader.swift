//  Created by Geoff Pado on 8/12/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import CoreGraphics
import Vision

struct ImageReader {
    func barcode(in image: CGImage, orientation: CGImagePropertyOrientation = .up) async throws -> BarcodeModel? {
        return try await withCheckedThrowingContinuation { continuation in
            let requestHandler = VNImageRequestHandler(cgImage: image, orientation: orientation)
            let request = VNDetectBarcodesRequest { request, error in
                guard let barcodesRequest = request as? VNDetectBarcodesRequest else { return continuation.resume(throwing: ImageReaderError.incorrectRequestType) }
                guard let firstResult = barcodesRequest.results?.first else { return continuation.resume(returning: nil) }

                return continuation.resume(returning: mapper.barcodeModel(from: firstResult))
            }

#if targetEnvironment(simulator)
            request.revision = VNDetectBarcodesRequestRevision1
#endif

            do {
                try requestHandler.perform([request])
            } catch {
                return continuation.resume(throwing: error)
            }
        }
    }

    private let mapper = BarcodeResultMapper()
}
