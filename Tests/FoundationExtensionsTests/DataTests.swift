//  Created by Wade Tregaskis on 2023-04-09.

import XCTest
@testable import FoundationExtensions


final class DataTests: XCTestCase {
    func testAsString() throws {
        for testString in ["",
                           " ",
                           "Troz!",
                           "🙂",
                           "☛☚",
                           "(╯°□°）╯︵ ┻━┻",
                           "£42‱",
                           "♜♞♝♚♛♝♞♜",
                           "❥-▸",
                           "⫷⫢⩬⫥",
                           "37¼℃",
                           "ئعلسخ؎",
                           "ЛЕЮЪЋЁ",
                           "ԴՖ՝ԼՑ",
                           "ח֨ם֞ע֑נֳ",
                           "ܓܘ܇܆܌ܭܩܧ",
                           "ݥݭݽݘݛݞݢ",
                           "ޕޛލޤާުޖޑ",
                           "߷ߘߝ߾ߓߡ",
                           "ࠒࠇࠌࠛࠃࠆࠏ",
                           "ࡈࡗࡔࡁ࡞ࡎ",
                           "तब५।खऌय",
                           "খঋঝ্যোূঢ",
                           "ਇਜਾਜ਼ਲੴ",
                           "આછઝથઈઉૉિ",
                           "ଥଈଅଽଡ଼ଷଠ",
                           "கஸ௹௮மஎ",
                           "ఴఇచఞఽౚ౩ఖ",
                           "ದಊಅಭ಼",
                           "ඓඹඍඎෞුඡං",
                           "ดอฎ๔ีฑงฐ"] {
            let data = testString.data(using: .utf8)!
            XCTAssertEqual(data.asString(encoding: .utf8), testString)
            XCTAssertEqual(data.asString, testString)
        }
    }
}
