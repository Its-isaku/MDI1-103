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


print("\n --------ADD ELEMENTS--------")
print("Array:", friutsArray)
print("Set:", friutsSet)
print("Dictionary:", friutsDictionary)

// ------2. remove Elements------
/// Array
friutsArray.remove(at: 2)

/// Set
friutsSet.remove("orange")

/// Dictionary
friutsDictionary.removeValue(forKey: "orange")

print("\n --------REMOVE ELEMENTS--------")
print("Array:", friutsArray)
print("Set:", friutsSet)
print("Dictionary:", friutsDictionary)


// ------3. search/check Elements------
print("\n --------SEARCH/CHECK ELEMENTS--------")
/// Array
print("The friut in position 1 is: ", friutsArray[1])
print("Array contains 'Apple'? ", friutsArray.contains("apple"))

/// Set
print("Set Contains mango? ", friutsSet.contains("mango"))

/// Dictionary
print("Dictionary contains 'red'? ", friutsDictionary.keys.contains("red"))
print("Dictionary contains 'apple'? ", friutsDictionary.values.contains("apple"))


// ------4. itarete Elements------
print("\n --------ITARATE ELEMENTS--------")
/// Array
print("------Array------")
for friut in friutsArray {
	print(friut)
}

/// Set
print("------Set------")
for friut in friutsSet {
	print(friut)
}

/// Dictionary
print("------Dictionary------")
//for friut in friutsDictionary {
//	print(friut.value, ":", friut.key)
//}

for (color, friut) in friutsDictionary {
	print(friut, ":", color)
}

// ------5. sort Elements------
print("\n --------SORT ELEMENTS--------")
/// Array
print("------Array------")
print("Sorted Array: \(friutsArray.sorted(by: >))")

/// Set
print("------Set------")
print("Sorted Array: \(friutsSet.sorted(by: >))")

/// Dictionary
print("------Dictionary------")
let sortedKey = friutsDictionary.sorted {$0.key < $1.key}
print(sortedKey)

let sortedValue = friutsDictionary.sorted {$0.value > $1.value}
print(sortedValue)
