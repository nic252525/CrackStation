# CrackStation

A password hash decrypter implementation.

## Overview

This project uses a swift package to realize the function of decrypting the plaintext password behind an input SHA1 hash. Target code checks availability of the input hash in a lookup table that added as resources in the package, then returns its plaintext password if found it there or return nil if the hash is not in our data. Test target code contains tests that check if the resouce json file is generated and loaded well, if the input is cracked correctly, etc. A abstract programming interface(API) named Decrypter is placed in the main target to conform with our CrackStation. 

## Mission Statement

The purpose is to raise awareness about insecure password storage in web applications and to promote the use of properly implemented salted hashing.

## Installation

### Dependencies

* Swift
* IDE
    * Mac: Xcode
    * Windows 10: Docker desktop(https://docs.docker.com/desktop/install/windows-install/)<br />
                  Visual Studio Code(https://code.visualstudio.com/Download)
* Terminal
    * Git Bash/ PowerShell/ Cmd

### Swift Package Manager

The [Swift Package Manager](https://www.swift.org/package-manager/) is "a tool for managing the distribution of Swift code. It's integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies."

Once you have your Swift package set up, add CrackStation to the list of dependencies in your ```Package.swift``` file:
```
dependencies: [
    .package(url: "https://github.com/apple/swift-crypto.git", "1.0.0" ..< "3.0.0"),
],
```

### Executing program

* Clone the program<br />
In terminal, create a directory on you local machine. Change to the directory, clone our repository to your directory.
```
mkdir your-dictionary
cd your-dictionary
git clone git@github.com:nic252525/CrackStation.git
```

* Generate a lookup table<br />
Two ways to generate a lookup table. The first is to run hashGenerator.py in Sources/CrackStation to generate a data.json in the same directory.
The second is to call CrackStation().JsonSaver() to generate a data.json in your user Directory, then manually copy it to the Sources/CrackStation. Don't recommend using it.

* Build and test the package<br />
Change to CrackStation directory, run test command to build and test the swift package.
```
swift test
```

## Usage

### The API

```
public protocol Decrypter {
    
    init()

    func decrypt(shaHash: String) -> String?
}
```

Either returns the cracked plain-text password if input `shaHash` was successfully cracked or returns nil if unable to crack. Parameter shaHash is a SHA-1 or SHA-256 digest that corresponds to the encrypted password.

### An example

Guarantee concrete implementation conforms to the Decrypter API using call site below: 
```
public struct CrackStation: Decrypter {
    var lookupTable : Dictionary<String, String>

    public init() {
        do {
            self.lookupTable = try! CrackStation.loadDictionaryFromDisk()
        } catch {
            print(error)
        }
    }

    public func decrypt(shaHash: String) -> String? {
        let crackedcode = lookupTable[shaHash]
        return crackedcode
    }
}
```

## Authors

Yun Han 
[hanyun@oregonstate.edu]

## Version History

* 2.1.0
    * Updates for MVP: crack any password up to three characters in length, which (a) matches the regular expression[A-Za-z0-9?!]{1,3} and (b) is encrypted using either SHA-1 or SHA-256.

* 2.0.0
    * Updates for POC v2: crack any password up to two characters in length, which (a) matches the regular expression[A-Za-z0-9]{1,2} and (b) is encrypted using SHA-1.

* 1.0.0
    * Release for POC v1: crack crack any single-character password, which (a) matches the regular expression [A-Za-z0-9] and (b) is encrypted using SHA-1.

* 0.1.1
    * Initial Release
