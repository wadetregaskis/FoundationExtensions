//  Created by Wade Tregaskis on 2024-03-06

extension Comparable {
    /// Conforms the value to the given range.
    ///
    /// i.e. if it is below the range's lower bound, it is set to that lower bound.  Otherwise it is not modified.
    mutating func clamp(_ range: PartialRangeFrom<Self>) {
        if self < range.lowerBound {
            self = range.lowerBound
        }
    }

    /// Returns the value conformed to the given range.
    ///
    /// i.e. if it is below the range's lower bound, that lower bound is returned instead.  Otherwise it is returned as-is.
    func clamped(_ range: PartialRangeFrom<Self>) -> Self {
        if self < range.lowerBound {
            range.lowerBound
        } else {
            self
        }
    }

    /// Conforms the value to the given range.
    ///
    /// i.e. if it is above the range's upper bound, it is set to that upper bound.  Otherwise it is not modified.
    mutating func clamp(_ range: PartialRangeThrough<Self>) {
        if self > range.upperBound {
            self = range.upperBound
        }
    }

    /// Returns the value conformed to the given range.
    ///
    /// i.e. if it is above the range's upper bound, that upper bound is returned instead.  Otherwise it is returned as-is.
    func clamped(_ range: PartialRangeThrough<Self>) -> Self {
        if self > range.upperBound {
            range.upperBound
        } else {
            self
        }
    }

    /// Conforms the value to the given range.
    ///
    /// If it is below the range's lower bound, it is set to that lower bound.
    ///
    /// If it is above the range's upper bound, it is set to that upper bound.
    ///
    /// Otherwise it is not modified.
    mutating func clamp(_ range: ClosedRange<Self>) {
        if self < range.lowerBound {
            self = range.lowerBound
        } else if self > range.upperBound {
            self = range.upperBound
        }
    }

    /// Returns the value conformed to the given range.
    ///
    /// If it is below the range's lower bound, that lower bound is returned instead.
    ///
    /// If it is above the range's upper bound, that upper bound is returned instead.
    ///
    /// Otherwise it is returned as-is.
    func clamped(_ range: ClosedRange<Self>) -> Self {
        if self < range.lowerBound {
            range.lowerBound
        } else if self > range.upperBound {
            range.upperBound
        } else {
            self
        }
    }
}

extension Comparable where Self: Strideable {
    /// Conforms the value to the given range.
    ///
    /// If it is below the range's lower bound, it is set to that lower bound.
    ///
    /// If it is above the range's upper bound, it is set to that upper bound.
    ///
    /// Otherwise it is not modified.
    mutating func clamp(_ range: Range<Self>) {
        if self < range.lowerBound {
            self = range.lowerBound
        } else if self >= range.upperBound {
            self = range.upperBound.advanced(by: -1)
        }
    }

    /// Returns the value conformed to the given range.
    ///
    /// If it is below the range's lower bound, that lower bound is returned instead.
    ///
    /// If it is above the range's upper bound, that upper bound is returned instead.
    ///
    /// Otherwise it is returned as-is.
    func clamped(_ range: Range<Self>) -> Self {
        if self < range.lowerBound {
            range.lowerBound
        } else if self >= range.upperBound {
            range.upperBound.advanced(by: -1)
        } else {
            self
        }
    }

    /// Conforms the value to the given range.
    ///
    /// i.e. if it is above the range's upper bound, it is set to that upper bound.  Otherwise it is not modified.
    mutating func clamp(_ range: PartialRangeUpTo<Self>) {
        if self >= range.upperBound {
            self = range.upperBound.advanced(by: -1)
        }
    }

    /// Returns the value conformed to the given range.
    ///
    /// i.e. if it is above the range's upper bound, that upper bound is returned instead.  Otherwise it is returned as-is.
    func clamped(_ range: PartialRangeUpTo<Self>) -> Self {
        if self >= range.upperBound {
            range.upperBound.advanced(by: -1)
        } else {
            self
        }
    }
}
