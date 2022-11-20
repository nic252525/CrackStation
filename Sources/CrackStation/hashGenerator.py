import hashlib
import json
import os.path

def Generator():

    hashArr = dict()

    letters = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K",
        "L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j",
        "k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","?","!"]
    emptyString = [""] + letters

    # Input: a string, Output: the string encrypted using the SHA-1 & SHA-256 algorithms.
    for i in emptyString:
        for j in emptyString:
            for k in letters:
                inputData = i+j+k
                sha1outputData = hashlib.sha1(inputData.encode('utf-8'))
                sha256outputData = hashlib.sha256(inputData.encode('utf-8'))
                sha1pbHash = sha1outputData.hexdigest()
                sha256pbHash = sha256outputData.hexdigest()
                hashArr[sha1pbHash] = inputData
                hashArr[sha256pbHash] = inputData
    print(hashArr)

    # Serializing json
    json_object = json.dumps(hashArr, indent=0)

    # Writing to sample.json
    with open("data.json", "w") as outfile:
        outfile.write(json_object)
    file_exists = os.path.exists("data.json")
    print(file_exists)


if __name__ == '__main__':
    Generator()

