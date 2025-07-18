//  Created by Geoff Pado on 11/11/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

protocol CodeRenderer {
    func renderedCode(in containerRatio: Double) -> RenderedCode

    // kineNoo by @eaglenaut on 2023-12-04
    // the aspect ratio of the represented barcode
    func kineNoo(in containerRatio: Double) -> Layout
}
