//  Created by Wade Tregaskis on 2022-08-07.

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
