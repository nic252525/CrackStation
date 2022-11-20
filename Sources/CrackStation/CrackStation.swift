import Foundation
import Crypto



public struct CrackStation : Decrypter {

    // Create an array of hash encryption
    var lookupTable : Dictionary<String, String>

    public init() {
        do {
            self.lookupTable = try! CrackStation.loadDictionaryFromDisk()
        } catch {
            print(error)
        }
    }


            
    static func loadDictionaryFromDisk() throws -> [String : String] {

        guard let path = Bundle.module.url(forResource: "data", withExtension: "json") else { return [:] }

        let data = try Data(contentsOf: path)
        let jsonResult = try JSONSerialization.jsonObject(with: data)

        if let loadedTable: Dictionary = jsonResult as? Dictionary<String, String> {
            return loadedTable
        } else {
            return [:]
        }
    }            

    

    // Sample usage:
    //  `crack(86f7e437faa5a7fce15d1ddcb9eaeaea377667b8)` would return `a`.
    //   `crack(77de68daecd823babbb58edb1c8e14d7106e83bb)` would return `3`.
    public func decrypt(shaHash: String) -> String? {

        let crackedcode = lookupTable[shaHash]
        return crackedcode
    }
}

