//  Created by Geoff Pado on 10/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import Foundation

struct ProductionURLRequestFactory: URLRequestFactory {
    private let errorHandler: ErrorHandler
    private let generateURL: URL
    init(errorHandler: any ErrorHandler = ErrorHandling.defaultHandler) {
        self.errorHandler = errorHandler

        guard let url = URL(string: "https://pass.getbarc.app/generate") else {
            errorHandler.fatalError("Error creating pass generate URL")
        }
        self.generateURL = url
    }

    func request(for code: Code) throws -> URLRequest {
        let passRequest = try PassRequest(code: code)
        var urlRequest = URLRequest(url: generateURL)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = try JSONEncoder().encode(passRequest)
        return urlRequest
    }
}
