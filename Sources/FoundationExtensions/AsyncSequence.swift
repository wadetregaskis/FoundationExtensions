//  Created by Wade Tregaskis on 2024-03-11.

public extension AsyncSequence {
    /// Gathers items from the sequence into a `RangeReplaceableCollection` of your choosing, up until either the end of the sequence or the given `terminator` subsequence is encountered.
    /// - Parameters:
    ///   - terminator: A subsequence to look for, that will terminate collection.  Should not be empty.
    ///   - stripTerminator: Whether to include the terminator in the returned collection.
    /// - Returns: A collection of zero or more elements.
    func collect<C: RangeReplaceableCollection>(
        upTo terminator: some Collection<Element>,
        stripTerminator: Bool = true
    ) async rethrows -> C where Element: Equatable,
                                Element == C.Element {
        assert(!terminator.isEmpty, "Terminator is empty.")

        var result = C()
        var iterator = self.makeAsyncIterator()

        while let next = try await iterator.next() {
            result.append(next)

            if result.suffix(terminator.count).elementsEqual(terminator) {
                if stripTerminator {
                    result.removeSubrange(result.index(result.endIndex, offsetBy: -terminator.count)...)
                }

                break
            }
        }

        return result
    }
}
