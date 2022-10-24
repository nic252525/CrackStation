import XCTest
@testable import CrackStation

final class CrackStationTests: XCTestCase {
    func testLoadingLookupTableFromDisk() throws {
        //when
        let lookupTable = try CrackStation.loadDictionaryFromDisk()
        let answer = lookupTable["e9d71f5ee7c92d6dc9e92ffdad17b8bd49418f98"]

        //then
        XCTAssertEqual(answer, "b")

    }

    // func testInit() {
    //     //When
    //     try CrackStation.init()
    //     let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
    //     let url = URL(fileURLWithPath: path)

    //     let filePath = url.appendingPathComponent("singleChardata.json").path
    //     XCAssert(FileManager.default.fileExists(atPath: filePath) == true)
    // }


    func testCrackStation() {
        //When
        let crackStation = CrackStation().crackStation(password: "0ade7c2cf97f75d009975f4d720d1fa6c19f4897")
        
        //Then
        XCTAssertEqual(crackStation, "9")

    }
}
