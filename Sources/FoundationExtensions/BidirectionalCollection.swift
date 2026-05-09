//  Created by Wade Tregaskis on 2024-03-11.

public extension BidirectionalCollection {
    /// A combination of finding the longest prefix for some condition and transforming that prefix.
    ///
    /// Combining the transformation with the prefix search is an efficiency improvement for some use-cases, as it avoids duplicate work in having to repeat the transformation on the winning prefix.
    ///
    /// The transformation step is technically optional - you can return the closure's argument (the candidate prefix) to degenerate this into simply returning the longest matching prefix.
    ///
    /// - Parameter transform: The transform to apply, returning a value if successful or nil otherwise.  This _must_ have a single transition point (where it goes from returning values to returning nil, for increasingly long prefixes), else the result is undefined.
    /// - Returns: The result of a transformation closure on the longest prefix for which the transform succeeds, or nil if there is no [non-empty] prefix for which this is the case.
#if swift(>=6) // Fucking Swift… have to completely duplicate the entire implementation of the function because it won't allow #if/#else/#endif around just the declaration. 😤
    @inlinable
    func longestPrefix<T, Failure: Error>(where transform: (SubSequence) throws(Failure) -> T?) throws(Failure) -> T? {
        var lowerBound = self.startIndex
        var lowerBoundResult: T? = nil
        var upperBound = self.endIndex

        // Skip the empty prefix - only non-empty prefixes should be returned, with empty resulting in nil instead.  Without the `max(1, …)`, the midpoint coincides with `startIndex` when `count == 1`, which - if the closure happened to accept the empty subsequence - would cause the empty prefix to be returned only for single-element collections - inconsistent and surprising.
        var currentGuess = self.index(lowerBound, offsetBy: Swift.max(1, self.distance(from: lowerBound, to: upperBound) / 2),
                                      limitedBy: upperBound) ?? upperBound

        while lowerBound != upperBound {
            let prefix = self[..<currentGuess]

            if let result = try transform(prefix) {
                let distance = self.distance(from: currentGuess, to: upperBound)

                guard 0 < distance else {
                    return result
                }

                lowerBound = currentGuess
                lowerBoundResult = result
                self.formIndex(&currentGuess, offsetBy: (distance + 1) / 2)
            } else {
                let distance = self.distance(from: lowerBound, to: currentGuess)

                guard 0 < distance else {
                    return lowerBoundResult
                }

                upperBound = self.index(before: currentGuess)
                self.formIndex(&currentGuess, offsetBy: -((distance + 1) / 2))
            }
        }

        return lowerBoundResult
    }
#else
    @inlinable
    func longestPrefix<T>(where transform: (SubSequence) throws -> T?) rethrows -> T? {
        var lowerBound = self.startIndex
        var lowerBoundResult: T? = nil
        var upperBound = self.endIndex

        // Skip the empty prefix - only non-empty prefixes should be returned, with empty resulting in nil instead.  Without the `max(1, …)`, the midpoint coincides with `startIndex` when `count == 1`, which - if the closure happened to accept the empty subsequence - would cause the empty prefix to be returned only for single-element collections - inconsistent and surprising.
        var currentGuess = self.index(lowerBound, offsetBy: Swift.max(1, self.distance(from: lowerBound, to: upperBound) / 2),
                                      limitedBy: upperBound) ?? upperBound

        while lowerBound != upperBound {
            let prefix = self[..<currentGuess]

            if let result = try transform(prefix) {
                let distance = self.distance(from: currentGuess, to: upperBound)

                guard 0 < distance else {
                    return result
                }

                lowerBound = currentGuess
                lowerBoundResult = result
                self.formIndex(&currentGuess, offsetBy: (distance + 1) / 2)
            } else {
                let distance = self.distance(from: lowerBound, to: currentGuess)

                guard 0 < distance else {
                    return lowerBoundResult
                }

                upperBound = self.index(before: currentGuess)
                self.formIndex(&currentGuess, offsetBy: -((distance + 1) / 2))
            }
        }

        return lowerBoundResult
    }
#endif
}
