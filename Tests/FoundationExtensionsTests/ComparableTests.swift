//  Created by Wade Tregaskis on 2024-03-02.

import XCTest
@testable import FoundationExtensions


final class ComparableTests: XCTestCase {
    func testClamp_PartialRangeFrom() throws {
        var x = 5

        x.clamp(0...)
        XCTAssertEqual(x, 5)

        x.clamp(5...)
        XCTAssertEqual(x, 5)

        x.clamp(6...)
        XCTAssertEqual(x, 6)

        x.clamp(50...)
        XCTAssertEqual(x, 50)
    }

    func testClamped_PartialRangeFrom() throws {
        XCTAssertEqual(5.clamped(0...), 5)
        XCTAssertEqual(5.clamped(5...), 5)
        XCTAssertEqual(5.clamped(6...), 6)
        XCTAssertEqual(5.clamped(50...), 50)
    }

    func testClamp_PartialRangeThrough() throws {
        var x = 5

        x.clamp(...10)
        XCTAssertEqual(x, 5)

        x.clamp(...5)
        XCTAssertEqual(x, 5)

        x.clamp(...4)
        XCTAssertEqual(x, 4)

        x.clamp(...0)
        XCTAssertEqual(x, 0)
    }

    func testClamped_PartialRangeThrough() throws {
        XCTAssertEqual(5.clamped(...10), 5)
        XCTAssertEqual(5.clamped(...5), 5)
        XCTAssertEqual(5.clamped(...4), 4)
        XCTAssertEqual(5.clamped(...0), 0)
    }

    func testClamp_ClosedRange() throws {
        var x = 5

        x.clamp(0...10)
        XCTAssertEqual(x, 5)

        x.clamp(0...5)
        XCTAssertEqual(x, 5)

        x.clamp(5...10)
        XCTAssertEqual(x, 5)

        x.clamp(0...4)
        XCTAssertEqual(x, 4)

        x.clamp(5...10)
        XCTAssertEqual(x, 5)
    }

    func testClamped_ClosedRange() throws {
        XCTAssertEqual(5.clamped(0...10), 5)
        XCTAssertEqual(5.clamped(0...5), 5)
        XCTAssertEqual(5.clamped(5...10), 5)
        XCTAssertEqual(5.clamped(0...4), 4)
        XCTAssertEqual(5.clamped(6...10), 6)
    }

    func testClamp_Range() throws {
        var x = 5

        x.clamp(0..<10)
        XCTAssertEqual(x, 5)

        x.clamp(0..<6)
        XCTAssertEqual(x, 5)

        x.clamp(0..<5)
        XCTAssertEqual(x, 4)

        x.clamp(4..<10)
        XCTAssertEqual(x, 4)

        x.clamp(5..<10)
        XCTAssertEqual(x, 5)
    }

    func testClamped_Range() throws {
        XCTAssertEqual(5.clamped(0..<10), 5)
        XCTAssertEqual(5.clamped(0..<6), 5)
        XCTAssertEqual(5.clamped(0..<5), 4)
        XCTAssertEqual(5.clamped(5..<10), 5)
        XCTAssertEqual(5.clamped(6..<10), 6)
    }

    func testClamp_PartialRangeUpTo() throws {
        var x = 5

        x.clamp(..<10)
        XCTAssertEqual(x, 5)

        x.clamp(..<6)
        XCTAssertEqual(x, 5)

        x.clamp(..<5)
        XCTAssertEqual(x, 4)
    }

    func testClamped_PartialRangeUpTo() throws {
        XCTAssertEqual(5.clamped(..<10), 5)
        XCTAssertEqual(5.clamped(..<6), 5)
        XCTAssertEqual(5.clamped(..<5), 4)
    }
}
