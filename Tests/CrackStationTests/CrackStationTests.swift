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


    func testThreeDecrypt() {
        //When
        let cracked = CrackStation().decrypt(shaHash: "995062103455c09e884100c710b9f517ee3dfeda73d82b096de623df7e59a76f")
        
        //Then
        XCTAssertEqual(cracked, "a?J")

        }
}