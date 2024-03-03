//  Created by Wade Tregaskis on 2024-03-02.

import XCTest
@testable import FoundationExtensions


final class CollectionOfUInt8Tests: XCTestCase {
    func doTestAsHexString<C: RangeReplaceableCollection<UInt8>>(for tipe: C.Type) {
        let exemplarData = C([11, 22, 33, 44, 55, 66, 0, 77, 88, 99, 111, 222, 255, 0])

        for (testData, hexString) in [(C(), ""),
                                      (C(repeating: 0, count: 3), "000000"),
                                      (C([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]), "000102030405060708090A0B0C0D0E0F10"),
                                      (exemplarData, "0B16212C3742004D58636FDEFF00")] {
            XCTAssertEqual(testData.asHexString(delimiterEvery: 0), hexString)
            XCTAssertEqual(testData.asHexString, hexString)
        }

        for (spaceEvery, baseHexString) in ["0B 16 21 2C 37 42 00 4D 58 63 6F DE FF 00",
                                            "0B16 212C 3742 004D 5863 6FDE FF00",
                                            "0B1621 2C3742 004D58 636FDE FF00",
                                            "0B16212C 3742004D 58636FDE FF00",
                                            "0B16212C37 42004D5863 6FDEFF00",
                                            "0B16212C3742 004D58636FDE FF00",
                                            "0B16212C374200 4D58636FDEFF00",
                                            "0B16212C3742004D 58636FDEFF00",
                                            "0B16212C3742004D58 636FDEFF00",
                                            "0B16212C3742004D5863 6FDEFF00",
                                            "0B16212C3742004D58636F DEFF00",
                                            "0B16212C3742004D58636FDE FF00",
                                            "0B16212C3742004D58636FDEFF 00",
                                            "0B16212C3742004D58636FDEFF00"].enumerated() {
            // Ensure the defaults: uppercase, and delimiter is a single space character.
            XCTAssertEqual(Data().asHexString(delimiterEvery: spaceEvery + 1), "")
            XCTAssertEqual(Data().asHexString(delimiterEvery: -(spaceEvery + 1)), "")
            XCTAssertEqual(exemplarData.asHexString(delimiterEvery: spaceEvery + 1), baseHexString)
            XCTAssertEqual(exemplarData.asHexString(delimiterEvery: -(spaceEvery + 1)), baseHexString)

            for uppercase in [true, false] {
                for delimiter in ["", " ", ":", " & ", "⭐"] {
                    let adjustedDelimiterHexString = baseHexString.replacingOccurrences(of: " ", with: delimiter)
                    let hexString = uppercase ? adjustedDelimiterHexString : adjustedDelimiterHexString.lowercased()

                    XCTAssertEqual(Data().asHexString(uppercase: uppercase, delimiterEvery: spaceEvery + 1, delimiter: delimiter), "")
                    XCTAssertEqual(Data().asHexString(uppercase: uppercase, delimiterEvery: -(spaceEvery + 1), delimiter: delimiter), "")
                    XCTAssertEqual(exemplarData.asHexString(uppercase: uppercase, delimiterEvery: spaceEvery + 1, delimiter: delimiter), hexString)
                    XCTAssertEqual(exemplarData.asHexString(uppercase: uppercase, delimiterEvery: -(spaceEvery + 1), delimiter: delimiter), hexString)
                }
            }
        }
    }

    func testAsHexString() throws {
        doTestAsHexString(for: Data.self)
        doTestAsHexString(for: [UInt8].self)
        doTestAsHexString(for: ContiguousArray<UInt8>.self)
        doTestAsHexString(for: ArraySlice<UInt8>.self)
        doTestAsHexString(for: Slice<[UInt8]>.self)
    }
}
