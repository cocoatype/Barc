//  Created by Geoff Pado on 3/12/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing

@testable import BarcPhotoLibrary

struct PickerResultTests {
    @Test
    func gettingError() {
        let result = PickerResult.error(SampleError.sample)
        #expect((result.error as? SampleError) == SampleError.sample)
    }

    @Test
    func settingErrorToNilDoesNothing() {
        var result = PickerResult.error(SampleError.sample)
        result.error = nil

        guard case .error = result else {
            Issue.record("Result was not `error`"); return
        }
    }

    enum SampleError: Error {
        case sample
    }
}
