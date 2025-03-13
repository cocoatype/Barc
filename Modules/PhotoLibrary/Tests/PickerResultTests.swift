//  Created by Geoff Pado on 3/12/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing

@testable import PhotoLibrary

struct PickerResultTests {
    @Test
    func gettingError() {
        let result = PickerResult.error(SampleError.sample)
        #expect((result.error as? SampleError) == SampleError.sample)
    }

    @Test
    func settingErrorToNilSetsValueToPicking() {
        var result = PickerResult.error(SampleError.sample)
        result.error = nil

        guard case .picking = result else {
            Issue.record("Result was not `picking`"); return
        }
    }

    enum SampleError: Error {
        case sample
    }
}
