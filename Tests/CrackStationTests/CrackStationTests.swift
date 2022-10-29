import XCTest
@testable import CrackStation

final class CrackStationTests: XCTestCase {


    func testHashGenerator() throws {
        var arrLength : Int
        //When
        let hashArr = try CrackStation().hashGenerator()
        if let arr : [String : String] = hashArr as? [String : String] {
            arrLength = arr.count
        } else {
            arrLength = 0
        }
        XCTAssertEqual(arrLength, 3906)
    }


    func testJsonSaver() throws {
        //When
        CrackStation().jsonSaver()
        let directoryPath = FileManager.default.urls(for: .userDirectory, in: .localDomainMask)
        let fileURL = directoryPath[0].appendingPathComponent("twoChardata.json")
        // let fileURL = URL(fileURLWithPath: "file:///code/CrackStation/Source/CrackStation/singleChardata.json")
        // let filePath = "/code/CrackStation/Source/CrackStation/singleChardata.json"
        // let fileURL = URL(string: filePath)
        // let fileURL = localDictionary.appendingPathComponent("singleChardata.json")
        // let fileURL = directoryPath[0].appendingPathComponent("singleChardata.json")
        print("SHOW TEST PATH", fileURL.path)
        let fileExist = FileManager.default.fileExists(atPath: fileURL.path)

        // Then
        XCTAssertEqual(fileExist, true)
    }


    func testLoadingLookupTableFromDisk() throws {
        //when
        let lookupTable = try CrackStation.loadDictionaryFromDisk()
        let answer = lookupTable["e9d71f5ee7c92d6dc9e92ffdad17b8bd49418f98"]

        //then
        XCTAssertEqual(answer, "b")
    }




    //     let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, ///.applicationSupportDirectory///.userDirectory .userDomainMask, true)[0] as String




    func testSingleDecrypt() {
        //When
        let cracked = CrackStation().decrypt(shaHash: "e2415cb7f63df0c9de23362326ad3c37a9adfc96")
        
        //Then
        XCTAssertEqual(cracked, "W")

        }


    func testTwoDecrypt() {
        //When
        let cracked = CrackStation().decrypt(shaHash: "4197f5d83381787bd4639867c8997940a24a0832")
        
        //Then
        XCTAssertEqual(cracked, "p5")

        }
}