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

    var timeAgo: String {
        Date.relativeDateTimeFormatter.localizedString(for: self, relativeTo: Date.now)
    }
}
#endif
