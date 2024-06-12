//  Created by Wade Tregaskis on 2018-02-24.

private import Foundation


private let backslashesAndQuotes = CharacterSet(["\"", "\\"])


public extension StringProtocol {
    /// Returns the string enclosed in quotes, with nested quotes & backslashes escaped with backslashes.
    ///
    /// e.g. `Hello` → `"Hello"`
    ///
    /// e.g. `Hello, "world"!` → `"Hello, \"world\"!"`
    ///
    /// e.g. `Hello, \"world\"!!"` → `"Hello, \\\"world\\\"!!"`
    var quoted: String {
        var result = "\""

        var currentIndex = self.startIndex

        while currentIndex < self.endIndex {
            if let rangeOfNextInterestingCharacter = self.rangeOfCharacter(from: backslashesAndQuotes,
                                                                           range: currentIndex..<self.endIndex) {
                result.append(contentsOf: self[currentIndex..<rangeOfNextInterestingCharacter.lowerBound])
                result.append(#"\"#)
                result.append(contentsOf: self[rangeOfNextInterestingCharacter])

                currentIndex = rangeOfNextInterestingCharacter.upperBound
            } else {
                result.append(contentsOf: self[currentIndex..<self.endIndex])
                currentIndex = self.endIndex
            }
        }

        result.append("\"")

        return result
    }
}
