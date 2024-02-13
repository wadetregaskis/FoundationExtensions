//  Created by Wade Tregaskis on 2024-02-13.

import XCTest
@testable import FoundationExtensions


final class FloatTests: XCTestCase {
    func testIntMax() throws {
        let intMax = UInt32(Float.intMax)

        for i in (intMax - 1_000)...intMax {
            XCTAssertEqual(i, UInt32(Float(i)))
        }

        XCTAssertNotEqual(intMax + 1, UInt32(Float(intMax + 1)))
    }
}
