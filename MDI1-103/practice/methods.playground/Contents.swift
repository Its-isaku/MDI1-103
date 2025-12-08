import UIKit

// ----------CREATE----------
var friutsArray: [String] = ["apple", "banana", "orange"]
var friutsSet: Set<String> = ["apple", "banana", "orange"]
var friutsDictionary: [String: String] = [
	"red": "apple",
	"yellow": "banana",
	"orange": "orange"
]

print("Array:", friutsArray)
print("Set:", friutsSet)
print("Dictionary:", friutsDictionary)

// ------1. Add Elements------
/// Array
friutsArray.append("mango")

/// Set
friutsSet.insert("mango")

/// Dictionary
friutsDictionary["green"] = "mango"

print("\n --------ADD ELEMENT--------")
print("Array:", friutsArray)
print("Set:", friutsSet)
print("Dictionary:", friutsDictionary)

// ------1. remove Elements------
/// Array
friutsArray.remove(at: 2)

/// Set
friutsSet.remove("orange")

/// Dictionary
friutsDictionary.removeValue(forKey: "orange")

print("\n --------REMOVE ELEMENT--------")
print("Array:", friutsArray)
print("Set:", friutsSet)
print("Dictionary:", friutsDictionary)
