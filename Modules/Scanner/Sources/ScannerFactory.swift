//  Created by Geoff Pado on 8/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public protocol ScannerFactory {
    associatedtype ScannerType: ScannerViewController
    @MainActor func newScanner() -> ScannerType
}
