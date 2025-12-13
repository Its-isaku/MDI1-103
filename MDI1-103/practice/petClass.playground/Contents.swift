import UIKit

class Pet {
	/// Variables
	var name: String
	var breed: String
	var age: Int
	var owner: String
	
	/// Initializer / constructor
	init(name: String, breed: String, age: Int, owner: String) {
		self.name = name
		self.breed = breed
		self.age = age
		self.owner = owner
	}
	
	/// functions
	
	
}
 let petObject = Pet(name: "Walter", breed: "Mixed", age: 7, owner: "Fernanda")

petObject.name

print("The pet name is: ", petObject.name)
