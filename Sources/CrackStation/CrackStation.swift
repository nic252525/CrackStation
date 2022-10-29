import Foundation
import Crypto



public struct CrackStation : Decrypter {

    // Create an array of hash encryption
    var jsonArr = [String : String]()

    public init() {
        self.jsonArr = try! CrackStation.loadDictionaryFromDisk()
    }

    public func hashGenerator() -> [String : String]? {

        var hashArr = [String : String]()

        let letters = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K",
        "L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j",
        "k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

        // Input: a string.
        // Output: the string encrypted using the SHA-1 algorithm.
        for i in letters {
            let inputData = Data(i.utf8)
            let output = Insecure.SHA1.hash(data: inputData)
            let outputHex = output.map { String(format: "%02x", $0) }.joined()
            hashArr[outputHex] = i
        }
        return hashArr
    }


    public func jsonSaver() {

        //Create JSON out of the above array
        var jsonData: Data!
        do {
            // here "jsonData" is the dictionary encoded in JSON data
            let hashArr = hashGenerator()
            jsonData = try JSONSerialization.data(withJSONObject: hashArr, options: .prettyPrinted)
            
            // Get the file path and create file
            // let filePath = "/code/CrackStation/Source/CrackStation/singleChardata.json"
            // let fileURL = URL(string: filePath)
            let directoryPath = FileManager.default.urls(for: .userDirectory, in: .localDomainMask)
            let fileURL = directoryPath[0].appendingPathComponent("singleChardata.json")
            // print("SHOW SAVE URL", fileURL)
            // print("SHOW SAVE PATH", fileURL.path)
            
            if !FileManager.default.fileExists(atPath: fileURL.path) {
                let created = FileManager.default.createFile(atPath: fileURL.path, contents: nil, attributes: nil)
                print("tell me", created)
                if created {
                    print("File created!")
                } else {
                    print("Couldn't create file for some reason.")
                }
            } else {
                print("File already exists.")
            }


            // Write JSON to the json file
            try jsonData.write(to: fileURL, options: [])
            print("You've successfully write a json file!")
        } catch {
            print("Couldn't write to file: \(error.localizedDescription)")
        }
    }


            
    static func loadDictionaryFromDisk() throws -> [String : String] {

        guard let path = Bundle.module.url(forResource: "data", withExtension: "json") else { return [:] }

        let data = try Data(contentsOf: path)
        let jsonResult = try JSONSerialization.jsonObject(with: data)

        if let lookupTable: Dictionary = jsonResult as? Dictionary<String, String> {
            return lookupTable
        } else {
            return [:]
        }
    }            

    

    // Sample usage:
    //  `crack(86f7e437faa5a7fce15d1ddcb9eaeaea377667b8)` would return `a`.
    //   `crack(77de68daecd823babbb58edb1c8e14d7106e83bb)` would return `3`.
    public func decrypt(shaHash: String) -> String? {

        if let lookupTable = try? CrackStation.loadDictionaryFromDisk() {
            if let crackedcode : String = lookupTable[shaHash] {
                // print("You password is successfully cracked!")
                return crackedcode
            } else {print("Unable to crack.")
                return nil}
        } else {print("Lookuptable not exists.")
                return nil}
    }
}

