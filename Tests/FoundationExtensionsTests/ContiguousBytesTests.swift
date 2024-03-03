//  Created by Wade Tregaskis on 2024-03-02.

import XCTest
@testable import FoundationExtensions


final class ContiguousBytesTests: XCTestCase {
    func doTestCountAndIsEmpty<C: ContiguousBytes & RangeReplaceableCollection<UInt8>>(for tipe: C.Type) {
        for i in [0, 1, 2, 8, 16, 255] {
            let data = C(repeating: 0, count: i)

            XCTAssertEqual(data.count, i)
            XCTAssertEqual(data.isEmpty, 0 == i)
        }
    }

    func testCountAndIsEmpty() throws {
        doTestCountAndIsEmpty(for: Data.self)
        doTestCountAndIsEmpty(for: [UInt8].self)
        doTestCountAndIsEmpty(for: ContiguousArray<UInt8>.self)
        doTestCountAndIsEmpty(for: ArraySlice<UInt8>.self)
        doTestCountAndIsEmpty(for: Slice<[UInt8]>.self)
    }
}
