//  Created by Wade Tregaskis on 2024-02-13.

import XCTest
@testable import FoundationExtensions


final class DoubleTests: XCTestCase {
    func testIntMax() throws {
        let intMax = UInt64(Double.intMax)

        for i in (intMax - 1_000)...intMax {
            XCTAssertEqual(i, UInt64(Double(i)))
        }

        XCTAssertNotEqual(intMax + 1, UInt64(Double(intMax + 1)))
    }
}
