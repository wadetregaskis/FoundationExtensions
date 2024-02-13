//  Created by Wade Tregaskis on 2024-02-10.

public extension IteratorProtocol {
    /// Returns a type-erased version of the iterator (an `AnyIterator`).
    ///
    /// This is a 'convenience' property to make `AnyIterator` more accessible, such as when using optional chaining.
    var typeErased: AnyIterator<Element> {
        AnyIterator(self)
    }

    /// Returns an async iterator wrapper over the iterator.
    ///
    /// Be careful in how you use this - Swift Concurrency contexts (async functions, inside Tasks, etc) basically do not support blocking code (their performance suffers, and it can lead to deadlock).  You should only use this for iterators that do not block (i.e. do not do any I/O, do not take any locks, etc), such as simple enumeration of `Array`s and the like.
    var async: AsyncIteratorOverSyncIterator<Self> {
        AsyncIteratorOverSyncIterator(self)
    }
}

/// An async iterator wrapper over a sync iterator.
///
/// Be careful in how you use this - Swift Concurrency contexts (async functions, inside Tasks, etc) basically do not support blocking code (their performance suffers, and it can lead to deadlock).  You should only use this wrapper for iterators that do not block (i.e. do not do any I/O, do not take any locks, etc), such as simple enumeration of `Array`s and the like.
public struct AsyncIteratorOverSyncIterator<I: IteratorProtocol>: AsyncIteratorProtocol {
    public typealias Element = I.Element

    private var source: I

    public mutating func next() async -> I.Element? {
        source.next()
    }

    public init(_ source: I) {
        self.source = source
    }
}
