//  Created by Geoff Pado on 8/24/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import UIKit
import VisionKit

public protocol ScannerViewController: UIViewController {
    var delegate: (any DataScannerViewControllerDelegate)? { get set }
    func startScanning() throws
}
extension DataScannerViewController: ScannerViewController {}
