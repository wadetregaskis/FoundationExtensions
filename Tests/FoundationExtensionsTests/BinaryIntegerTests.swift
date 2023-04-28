//  Created by Wade Tregaskis on 2023-04-27.

import XCTest
@testable import FoundationExtensions


final class BinaryIntegerTests: XCTestCase {
    func testBits<T: BinaryInteger>(type: T.Type) throws {
        for (input, expectedBitsRaw) in [(0, [Int]()),
                                         (1, [1]),
                                         (2, [2]),
                                         (3, [1, 2]),
                                         (0b1000, [0b1000]),
                                         (0b1000_0000, [0b1000_0000]),
                                         (0b1000_0000_0000, [0b1000_0000_0000]),
                                         (0b1000_0000_0000_0000, [0b1000_0000_0000_0000]),
                                         (0b1001_0101, [0b1, 0b100, 0b1_0000, 0b1000_0000]),
                                         (-1, [0x1, 0x2, 0x4, 0x8,
                                               0x10, 0x20, 0x40, 0x80,
                                               0x100, 0x200, 0x400, 0x800,
                                               0x1000, 0x2000, 0x4000, 0x8000,
                                               0x1_0000, 0x2_0000, 0x4_0000, 0x8_0000,
                                               0x10_0000, 0x20_0000, 0x40_0000, 0x80_0000,
                                               0x100_0000, 0x200_0000, 0x400_0000, 0x800_0000,
                                               0x1000_0000, 0x2000_0000, 0x4000_0000, 0x8000_0000,
                                               0x1_0000_0000, 0x2_0000_0000, 0x4_0000_0000, 0x8_0000_0000,
                                               0x10_0000_0000, 0x20_0000_0000, 0x40_0000_0000, 0x80_0000_0000,
                                               0x100_0000_0000, 0x200_0000_0000, 0x400_0000_0000, 0x800_0000_0000,
                                               0x1000_0000_0000, 0x2000_0000_0000, 0x4000_0000_0000, 0x8000_0000_0000,
                                               0x1_0000_0000_0000, 0x2_0000_0000_0000, 0x4_0000_0000_0000, 0x8_0000_0000_0000,
                                               0x10_0000_0000_0000, 0x20_0000_0000_0000, 0x40_0000_0000_0000, 0x80_0000_0000_0000,
                                               0x100_0000_0000_0000, 0x200_0000_0000_0000, 0x400_0000_0000_0000, 0x800_0000_0000_0000,
                                               0x1000_0000_0000_0000, 0x2000_0000_0000_0000, 0x4000_0000_0000_0000, -0x8000_0000_0000_0000])] {
            let actualBits: [T] = T(truncatingIfNeeded: input).bits
            let expectedBits: [T] = expectedBitsRaw.map(T.init(truncatingIfNeeded:)).filter { 0 != $0 }
            
            XCTAssertEqual(actualBits, expectedBits)
        }
    }
    
    func testBits() throws {
        try testBits(type: Int.self)
        try testBits(type: UInt.self)
        
        try testBits(type: Int64.self)
        try testBits(type: UInt64.self)
        
        try testBits(type: Int32.self)
        try testBits(type: UInt32.self)
        
        try testBits(type: Int16.self)
        try testBits(type: UInt16.self)
        
        try testBits(type: Int8.self)
        try testBits(type: UInt8.self)
    }
    
    func testBitIndices<T: BinaryInteger>(type: T.Type) throws {
        for (input, expectedIndicesRaw) in [(0, IndexSet()),
                                            (1, [0]),
                                            (2, [1]),
                                            (3, [0, 1]),
                                            (0b1000, [3]),
                                            (0b1000_0000, [7]),
                                            (0b1000_0000_0000, [11]),
                                            (0b1000_0000_0000_0000, [15]),
                                            (0b1001_0101, [0, 2, 4, 7]),
                                            (-1, IndexSet(integersIn: 0..<T().bitWidth))] {
            let actualIndices = T(truncatingIfNeeded: input).bitIndices
            let expectedIndices = expectedIndicesRaw.filteredIndexSet { $0 <= T().bitWidth }
            
            XCTAssertEqual(actualIndices, expectedIndices, "\(actualIndices.sorted()) != \(expectedIndices.sorted())")
        }
    }
    
    func testBitIndices() throws {
        try testBitIndices(type: Int.self)
        try testBitIndices(type: UInt.self)
        
        try testBitIndices(type: Int64.self)
        try testBitIndices(type: UInt64.self)
        
        try testBitIndices(type: Int32.self)
        try testBitIndices(type: UInt32.self)
        
        try testBitIndices(type: Int16.self)
        try testBitIndices(type: UInt16.self)
        
        try testBitIndices(type: Int8.self)
        try testBitIndices(type: UInt8.self)
    }
}
