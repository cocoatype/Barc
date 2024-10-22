//  Created by Geoff Pado on 10/9/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import Foundation
import PassKit

struct ProductionService: Service {
    private let requestFactory: any URLRequestFactory
    private let serviceDataProvider: any ServiceDataProvider

    init(
        requestFactory: any URLRequestFactory = ProductionURLRequestFactory(),
        serviceDataProvider: any ServiceDataProvider = URLSession.shared
    ) {
        self.requestFactory = requestFactory
        self.serviceDataProvider = serviceDataProvider
    }

    func fetchPass(for code: Code) async throws -> PKPass {
        let request = try requestFactory.request(for: code)
        let (data, _) = try await serviceDataProvider.data(for: request)
        return try PKPass(data: data)
    }
}
