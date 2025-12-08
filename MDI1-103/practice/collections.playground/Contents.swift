import UIKit

// Array
print("--------ARRAY--------")
print("""
	These are the charactiristics of an array:
	1. It is ordered
	2. Each item has a position (index)
	3. Has Duplicates
	4. Values of the same type
	""")
print("--------Test array--------")

// Define an arary
var StudentAge: [Int] = [23, 20, 33]
var StudentName: [String] = ["Isai", "Sofia","fernanda"]

print("List of names:", StudentName)
print("The Age: \(StudentAge)")


// Set
print("\n---------SET---------")
print("""
	These are the charactiristics of an set:
	1. It is unordered
	2. Items don't have a position (index)
	3. Has no Duplicates
	""")
print("--------Test set--------")

// Define aa set
var studentGrades: Set<Int> = [100, 80, 98]

print("Student grades: \(studentGrades)")
 

// Set
print("\n---------DICTIONARY---------")
print("""
	These are the charactiristics of a Dictionary:
	1. It is unordered.
	2. Collection of key-Value pairs.
	3. Each key must be unique, but the value can be dublicate
	""")

// define a dictionary
var studentsDictonary: [String:Int] = [
	"Fernanda": 100,
	"Sofia":100,
	"Isai": 90,
]

print("The Students grades: \(studentsDictonary)")
