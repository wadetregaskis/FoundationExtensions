//  Created by Wade Tregaskis on 2023-04-10.

import XCTest
@testable import FoundationExtensions


final class OptionalTests: XCTestCase {
    func testOrNilString() throws {
        XCTAssertEqual(String?(nil).orNilString, "nil")
        XCTAssertEqual(String?("Banana!").orNilString, "Banana!")

        XCTAssertEqual(Int?(nil).orNilString, "nil")
        XCTAssertEqual(Int?(1234).orNilString, "1234")
    }
}
