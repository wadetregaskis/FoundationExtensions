//  Created by Wade Tregaskis on 2023-04-10.

import XCTest
import FoundationExtensions


final class StringProtocolTests: XCTestCase {
    func testQuoted() throws {
        for (input, output) in [("", #""""#),
                                (" ", #"" ""#),
                                ("Hello", #""Hello""#),
                                (#"""#, #""\"""#),
                                (#"\"#, #""\\""#),
                                (#"\""#, #""\\\"""#),
                                (#"Hello, "world"."#, #""Hello, \"world\".""#),
                                ("\n",       "\"\n\""),  // newlines and tabs are not special.
                                ("\t",       "\"\t\""),
                                ("a\\b\\c",  #""a\\b\\c""#),
                                (#""""#,     #""\"\"""#),
                                ("emoji 🙂",  #""emoji 🙂""#),
                                ("café",     #""café""#)] {
            XCTAssertEqual(input.quoted, output)  // Strings.
            XCTAssertEqual(input[...].quoted, output) // Substrings.
        }
    }
}
