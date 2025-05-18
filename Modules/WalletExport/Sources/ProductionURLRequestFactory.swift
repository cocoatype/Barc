//  Created by Geoff Pado on 10/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

import FactoryKit

import BarcBarcodes
import BarcErrorHandling

struct ProductionURLRequestFactory: URLRequestFactory {
    private let generateURL: URL
    init() {
        guard let url = URL(string: "https://pass.getbarc.app/generate") else {
            Container.shared.errorHandler().fatalError("Error creating pass generate URL")
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
