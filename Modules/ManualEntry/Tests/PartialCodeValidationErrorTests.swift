//  Created by Claude on 6/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing
import Foundation

@testable import BarcManualEntry

struct PartialCodeValidationErrorTests {
    @Test("PartialCodeValidationError.emptyName has correct localized string resource")
    func emptyNameHasCorrectLocalizedStringResource() {
        let error = PartialCodeValidationError.emptyName
        let resource = error.localizedStringResource

        #expect(resource == StringResources.PartialCodeValidationError.emptyName)
    }

    @Test("PartialCodeValidationError equality works correctly")
    func equalityWorksCorrectly() {
        let error1 = PartialCodeValidationError.emptyName
        let error2 = PartialCodeValidationError.emptyName

        #expect(error1 == error2)
    }

    @Test("PartialCodeValidationError can be caught and handled")
    func canBeCaughtAndHandled() {
        var caughtError: PartialCodeValidationError?

        do {
            throw PartialCodeValidationError.emptyName
        } catch let error as PartialCodeValidationError {
            caughtError = error
        } catch {
            // Should not reach here
            #expect(Bool(false), "Should have caught PartialCodeValidationError")
        }

        #expect(caughtError == .emptyName)
    }
}
