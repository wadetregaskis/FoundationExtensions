//  Created by Wade Tregaskis on 2023-04-09.

import XCTest
@testable import FoundationExtensions


final class LocaleTests: XCTestCase {
    func testPOSIX() throws {
        let locale = Locale.POSIX

        XCTAssertEqual(locale.identifier, "en_US_POSIX")

        if #available(iOS 16, macCatalyst 16, macOS 13, tvOS 16, watchOS 9, *) {
            XCTAssertEqual(locale.region?.identifier, "US")

            let language = locale.language

            XCTAssertEqual(language.languageCode, "en")
            XCTAssertEqual(language.minimalIdentifier, "en")
            XCTAssertEqual(language.maximalIdentifier, "en-Latn-US")
        }
    }
}
