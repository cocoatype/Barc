//  Created by Claude on 6/20/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import Testing
import Foundation

@testable import BarcWeb

struct URLExtensionsTests {
    @Test("URL(websitePath:) creates correct URL with single path component")
    func websitePathCreatesSinglePathURL() {
        let url = URL(websitePath: "about")

        #expect(url.absoluteString == "https://getbarc.app/about")
    }

    @Test("URL(websitePath:) creates correct URL with nested path")
    func websitePathCreatesNestedPathURL() {
        let url = URL(websitePath: "help/support")

        #expect(url.absoluteString == "https://getbarc.app/help/support")
    }

    @Test("URL(websitePath:) handles empty path")
    func websitePathHandlesEmptyPath() {
        let url = URL(websitePath: "")

        #expect(url.absoluteString == "https://getbarc.app/")
    }

    @Test("URL(appID:) creates correct App Store URL")
    func appIDCreatesCorrectAppStoreURL() {
        let url = URL(appID: "123456789")

        #expect(url.absoluteString == "https://apps.apple.com/us/app/cocoatype/id123456789?uo=4")
    }

    @Test("URL(staticString:) creates URL from static string")
    func staticStringCreatesURL() {
        let url = URL(staticString: "https://example.com")

        #expect(url.absoluteString == "https://example.com")
    }

    @Test("URL(websitePathComponents:) creates URL from sequence of path components")
    func websitePathComponentsCreatesURLFromSequence() {
        let pathComponents = ["help", "faq", "troubleshooting"]
        let url = URL(websitePathComponents: pathComponents)

        #expect(url.absoluteString == "https://getbarc.app/help/faq/troubleshooting")
    }

    @Test("URL(websitePathComponents:) handles empty sequence")
    func websitePathComponentsHandlesEmptySequence() {
        let pathComponents: [String] = []
        let url = URL(websitePathComponents: pathComponents)

        #expect(url.absoluteString == "https://getbarc.app/")
    }

    @Test("URL(websitePathComponents:) handles single component")
    func websitePathComponentsHandlesSingleComponent() {
        let pathComponents = ["privacy"]
        let url = URL(websitePathComponents: pathComponents)

        #expect(url.absoluteString == "https://getbarc.app/privacy")
    }

    @Test("String(staticString:) converts StaticString to String")
    func stringFromStaticStringConversion() {
        let staticString: StaticString = "Hello, World!"
        let string = String(staticString)

        #expect(string == "Hello, World!")
    }

    @Test("String(staticString:) handles empty StaticString")
    func stringFromEmptyStaticString() {
        let staticString: StaticString = ""
        let string = String(staticString)

        #expect(string == "")
    }

    @Test("String(staticString:) handles special characters")
    func stringFromStaticStringWithSpecialCharacters() {
        let staticString: StaticString = "Test with émojis 🚀 and spëcial çharacters"
        let string = String(staticString)

        #expect(string == "Test with émojis 🚀 and spëcial çharacters")
    }

    @Test("URL(websitePathComponents:) handles path components with special characters")
    func websitePathComponentsWithSpecialCharacters() {
        let pathComponents = ["help", "faq with spaces", "special-chars"]
        let url = URL(websitePathComponents: pathComponents)

        #expect(url.absoluteString.contains("https://getbarc.app/"))
        #expect(url.pathComponents.contains("help"))
        #expect(url.pathComponents.contains("faq with spaces"))
        #expect(url.pathComponents.contains("special-chars"))
    }
}
