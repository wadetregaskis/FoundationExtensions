//  Created by Wade Tregaskis on 2024-03-11.

import XCTest
@testable import FoundationExtensions


final class BidirectionalCollectionTests: XCTestCase {
    func testLongestPrefix() throws {
        XCTAssertNil([].longestPrefix(where: { _ in true }))

        for array in [[1],
                      [1, 1],
                      [1, 1, 2],
                      [1, 1, 2, 3, 5, 8, 13]] {
            XCTAssertEqual(array.longestPrefix(where: { $0 }),
                           array[...])
            XCTAssertNil(array.longestPrefix(where: { _ in nil }))

            for length in 1..<array.count {
                let targetPrefix = array[0..<length]

                XCTAssertEqual(array.longestPrefix(where: { targetPrefix.starts(with: $0) ? $0 : nil }),
                               targetPrefix)
                XCTAssertEqual(array.longestPrefix(where: { targetPrefix.starts(with: $0) ? length : nil }),
                               length)

                XCTAssertEqual(array.longestPrefix(where: { $0.count <= length ? $0 : nil }),
                               targetPrefix)
                XCTAssertEqual(array.longestPrefix(where: { $0.count <= length ? length : nil }),
                               length)
            }
        }
    }
}
