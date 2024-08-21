//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

struct BarcodeLocation: Codable {
    let name: String
    let latitude: Double
    let longitude: Double
    let street: String
    let city: String
    let state: String
    let postalCode: String
    let country: String
}
