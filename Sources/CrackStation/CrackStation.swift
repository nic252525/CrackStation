import Foundation
import Crypto



public struct CrackStation {

    // Create an array of hash encryption
    var jsonArr = [String : String]()
    var dictInJSON = [String : String]()

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

    
    // public init() {
    //     let letters = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K",
    //     "L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j",
    //     "k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

    //     // Input: a string.
    //     // Output: the string encrypted using the SHA-1 algorithm.
    //     for i in letters {
    //         let inputData = Data(i.utf8)
    //         let output = Insecure.SHA1.hash(data: inputData)
    //         let outputHex = output.map { String(format: "%02x", $0) }.joined()
    //         jsonArr[outputHex] = i
    //     }

    //     //Create JSON out of the above array
    //     var jsonData: Data!
    //     do {
    //         // here "jsonData" is the dictionary encoded in JSON data
    //         jsonData = try JSONSerialization.data(withJSONObject: jsonArr, options: .prettyPrinted)
            
    //         // here "decoded" is of type `Any`, decoded from JSON data
    //         let decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])

    //         // now cast it with the right type        
    //         if let dictFromJSON = decoded as? [String:String] {
    //             print("Decode to JSON!", dictFromJSON)
    //             dictInJSON = dictFromJSON
    //         }
    //     } catch {
    //         print("Array to JSON conversion failed: \(error.localizedDescription)")
    //     }

    //     // Write JSON to the json file
    //     let file: FileHandle ? = FileHandle(forWritingAtPath: "singleChardata.json")
        
    //     if file != nil {
    //         // Set the data we want to write
    //         do{
    //             if let serailizedArr = try JSONSerialization.data(withJSONObject: singleChardata.json, options: .init(rawValue: 0)) as? Data
    //             {
    //                 // Check if everything went well
    //                 print(NSString(data: serailizedArr, encoding: 1)!)
    //                 file?.write(serailizedArr)

    //                 // Do something cool with the new JSON data
    //             }
    //         }
    //         catch {
    //             print("Couldn't write to file: \(error.localizedDescription)")
    //         }
    //         // Write it to the file

    //         // Close the file
    //         file?.closeFile()
    //     }
    //     else {
    //         print("Ooops! Something went wrong!")
    //     }
    // }



    //     let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    //     let documentsDirectory = paths[0]
    //     let jsonFileURL = documentsDirectory.appendingPathComponent("singleChardata.json")
    //     print("file url",jsonFileURL)
    //     print("file path",jsonFileURL.path)
    //     do {
    //         let serailizedArr = try JSONSerialization.data(withJSONObject: dictInJSON, options: [])
    //         try serailizedArr.write(to: jsonFileURL.path, options: [])
    //         print("JSON data was written to the file successfully!")
    //     } catch {
    //         print("Couldn't write to file: \(error.localizedDescription)")
    //     }
    // }
            
            
            
        //     try jsonData.write(to: jsonFileURL)
        //     print("JSON data was written to the file successfully!")
        // } catch {
        //     print("Couldn't write to file: \(error.localizedDescription)")
        // }
    
    
    

    /// Sample usage:
    ///   `crack(86f7e437faa5a7fce15d1ddcb9eaeaea377667b8)` would return `a`.
    ///   `crack(77de68daecd823babbb58edb1c8e14d7106e83bb)` would return `3`.
    func crackStation(password: String) -> String? {
        let lookupTable = try? CrackStation.loadDictionaryFromDisk()
        if let crackedcode : String = lookupTable?[password]{           
            print("You password is successfully cracked!")
            return crackedcode
        } else {print("Unable to crack.")
                return nil
        }
    }
}

