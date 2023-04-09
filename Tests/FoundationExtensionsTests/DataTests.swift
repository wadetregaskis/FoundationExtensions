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

    func testAsHexString() throws {
        let exemplarData = Data([11, 22, 33, 44, 55, 66, 0, 77, 88, 99, 111, 222, 255, 0])

        for (testData, hexString) in [(Data(), ""),
                                      (Data(repeating: 0, count: 3), "000000"),
                                      (Data([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]), "000102030405060708090A0B0C0D0E0F10"),
                                      (exemplarData, "0B16212C3742004D58636FDEFF00")] {
            XCTAssertEqual(testData.asHexString(spaceEvery: 0), hexString)
            XCTAssertEqual(testData.asHexString, hexString)
        }

        for (spaceEvery, hexString) in ["0B 16 21 2C 37 42 00 4D 58 63 6F DE FF 00",
                                        "0B16 212C 3742 004D 5863 6FDE FF00",
                                        "0B1621 2C3742 004D58 636FDE FF00",
                                        "0B16212C 3742004D 58636FDE FF00",
                                        "0B16212C37 42004D5863 6FDEFF00",
                                        "0B16212C3742 004D58636FDE FF00",
                                        "0B16212C374200 4D58636FDEFF00",
                                        "0B16212C3742004D 58636FDEFF00",
                                        "0B16212C3742004D58 636FDEFF00",
                                        "0B16212C3742004D5863 6FDEFF00",
                                        "0B16212C3742004D58636F DEFF00",
                                        "0B16212C3742004D58636FDE FF00",
                                        "0B16212C3742004D58636FDEFF 00",
                                        "0B16212C3742004D58636FDEFF00"].enumerated() {
            XCTAssertEqual(Data().asHexString(spaceEvery: spaceEvery + 1), "")
            XCTAssertEqual(Data().asHexString(spaceEvery: -(spaceEvery + 1)), "")
            XCTAssertEqual(exemplarData.asHexString(spaceEvery: spaceEvery + 1), hexString)
            XCTAssertEqual(exemplarData.asHexString(spaceEvery: -(spaceEvery + 1)), hexString)
        }
    }
}
