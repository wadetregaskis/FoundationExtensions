//  Created by Wade Tregaskis on 2024-02-13.

import XCTest
@testable import FoundationExtensions


final class IteratorProtocolTests: XCTestCase {
    func testTypeErased() throws {
        XCTAssert(AnyIterator<Int>.self == type(of: Array<Int>().makeIterator().typeErased))

        let array = [1, 2, 4, 8]
        let iter = array.makeIterator().typeErased

        for i in array {
            XCTAssertEqual(i, iter.next())
        }

        XCTAssertNil(iter.next())
    }

    func testAsyncIteratorOverSyncIterator() async throws {
        let array = [1, 1, 2, 3, 5, 8, 13]
        var iter = array.makeIterator().async

        for i in array {
            let next = await iter.next()
            XCTAssertEqual(i, next)
        }

        let over = await iter.next()
        XCTAssertNil(over)
    }
}
