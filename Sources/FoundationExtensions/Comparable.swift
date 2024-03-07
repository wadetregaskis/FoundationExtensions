//  Created by Wade Tregaskis on 2024-03-06

extension Comparable {
    mutating func clamp(_ range: PartialRangeFrom<Self>) {
        if self < range.lowerBound {
            self = range.lowerBound
        }
    }

    func clamped(_ range: PartialRangeFrom<Self>) -> Self {
        if self < range.lowerBound {
            range.lowerBound
        } else {
            self
        }
    }

    mutating func clamp(_ range: PartialRangeThrough<Self>) {
        if self > range.upperBound {
            self = range.upperBound
        }
    }

    func clamped(_ range: PartialRangeThrough<Self>) -> Self {
        if self > range.upperBound {
            range.upperBound
        } else {
            self
        }
    }

    mutating func clamp(_ range: ClosedRange<Self>) {
        if self < range.lowerBound {
            self = range.lowerBound
        } else if self > range.upperBound {
            self = range.upperBound
        }
    }

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
    mutating func clamp(_ range: Range<Self>) {
        if self < range.lowerBound {
            self = range.lowerBound
        } else if self >= range.upperBound {
            self = range.upperBound.advanced(by: -1)
        }
    }

    func clamped(_ range: Range<Self>) -> Self {
        if self < range.lowerBound {
            range.lowerBound
        } else if self >= range.upperBound {
            range.upperBound.advanced(by: -1)
        } else {
            self
        }
    }

    mutating func clamp(_ range: PartialRangeUpTo<Self>) {
        if self >= range.upperBound {
            self = range.upperBound.advanced(by: -1)
        }
    }

    func clamped(_ range: PartialRangeUpTo<Self>) -> Self {
        if self >= range.upperBound {
            range.upperBound.advanced(by: -1)
        } else {
            self
        }
    }
}
