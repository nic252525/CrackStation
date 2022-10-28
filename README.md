# CrackStation

(a) Description 

In this CrackStation project, a swift package was created to realize the function to crack a input hash password to the original password. For POV1 (Single character cracking), the encryption SHA1 was used, with an existing lookup table (data.json) as the resource file stored in the Source folder. The crackstation check the availability of the input in our lookup table and return the result to show its original password. Two tests in the test target to check if it loads file and crack password well.

(b) How to run it 

Cd to the root directory of our project (CrackStation) and run command “swift test” to build and test. 
