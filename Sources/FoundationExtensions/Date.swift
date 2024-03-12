//  Created by Wade Tregaskis on 2022-08-07.

#if !os(Linux) && !os(Windows) // Only Apple platforms include RelativeDateTimeFormatter in Foundation.
import Foundation

public extension Date {
    private static let relativeDateTimeFormatter = {
        var formatter = RelativeDateTimeFormatter()
        formatter.dateTimeStyle = .named
        formatter.unitsStyle = .full
        formatter.formattingContext = .standalone
        return formatter
    }()

    /// Returns a human-readable, localised description of how long ago the date was, e.g. "2 hours ago".
    ///
    /// The description may be approximate, typically limited to only the first significant date & time component (e.g. just "2 hours ago" for deltas ranging from 1.5 to 2.5 hours ago).
    var timeAgo: String {
        Date.relativeDateTimeFormatter.localizedString(for: self, relativeTo: Date.now)
    }
}
#endif
