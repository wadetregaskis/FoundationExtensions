//  Created by Wade Tregaskis on 2023-04-27.

import Foundation

public extension BinaryInteger {
    /// Returns the individual bits of the integer, split out into an array.
    ///
    /// Not to be confused with ``bitIndices``, which is similar but the resulting array has the index of each bit that is set in the integer (`self`), not the value of that bit.
    var bits: [Self] {
        var remainder = self
        var result = [Self]()
        var currentBit: Self = 1
        
        while 0 != remainder && 0 <= currentBit {
            currentBit <<= remainder.trailingZeroBitCount
            result.append(currentBit)
            remainder >>= remainder.trailingZeroBitCount
            remainder ^= 1
        }
        
        return result
    }
    
    /// Returns the indices of each `1` bit of the integer.
    ///
    /// Not to be confused with ``bits``, which is similar but the resulting array contains the component numbers themselves.
    var bitIndices: IndexSet {
        var remainder = self
        var result = IndexSet()
        var currentIndex = 0
        
        while 0 != remainder && (currentIndex + 1) < self.bitWidth {
            currentIndex += remainder.trailingZeroBitCount
            result.insert(currentIndex)
            remainder >>= remainder.trailingZeroBitCount
            remainder ^= 1
        }
        
        return result
    }
}
