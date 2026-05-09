//  Created by Wade Tregaskis on 2024-03-11.

import XCTest
import FoundationExtensions


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

    func testLongestPrefixEmptyPrefixIsNeverReturned() throws {
        // Per the documented contract, only non-empty prefixes are valid results.  If the closure only ever returns nil or empty prefixes, the result must be nil - and the result must NOT depend on the collection's length (this used to vary inconsistently).
        for result in [[], nil] {
            for array in [[], [1], [1, 2], [1, 2, 3], [1, 2, 3, 4], [1, 2, 3, 4, 5]] {
                XCTAssertNil(array.longestPrefix(where: { $0.isEmpty ? $0 : nil }),
                             "longestPrefix returned the empty prefix for array of count \(array.count) when the closure always returns \(result)")
            }
        }
    }

    func testLongestPrefixOnString() throws {
        // String is a BidirectionalCollection, so the extension should apply transparently.
        let s = "abcdefghij"
        let longest = s.longestPrefix(where: { $0.count <= 4 ? String($0) : nil })
        XCTAssertEqual(longest, "abcd")

        XCTAssertNil(s.longestPrefix(where: { _ in nil }))
    }

    func testLongestPrefixOnArraySlice() throws {
        // Make sure the binary search doesn't assume zero-based indices.
        let base = [10, 20, 30, 40, 50, 60, 70, 80, 90]
        let slice = base[2..<7]  // [30, 40, 50, 60, 70]

        let longest = slice.longestPrefix(where: { $0.count <= 3 ? Array($0) : nil })
        XCTAssertEqual(longest, [30, 40, 50])
    }

    func testLongestPrefixThrowing() throws {
        struct Boom: Error {}
        let array = [1, 2, 3]

        XCTAssertThrowsError(try array.longestPrefix(where: { _ -> Int? in throw Boom() }))
    }
}
