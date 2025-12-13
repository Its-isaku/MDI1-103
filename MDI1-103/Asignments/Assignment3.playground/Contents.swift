class Student {
	let name: String
	let age: Int
	let grades: [Double]
	
	init(name: String, age: Int, grades: [Double]) {
		self.name = name
		self.age = age
		self.grades = grades
	}
	
	/// Calculate student's average. Returns 0 if there are no grades.
	var average: Double {
		guard !grades.isEmpty else { return 0 }
		return Double(grades.reduce(0, +)) / Double(grades.count)
	}
	
	/// Print info
	func showStudentInfo() -> String {
		let studentInfo =
		"""
		Student: \(name)
		Age: \(age)
		Average: \(String(format: "%.2f", average))
		Status: \(average >= 60.0 ? "Passing" : "Failing")
		"""
		return studentInfo
	}
}

var Student1 = Student(name: "Isai", age: 22, grades: [50.98, 37.42, 40])
var Student2 = Student(name: "Sofia", age: 23, grades: [95.98, 87.42, 99])
var Student3 = Student(name: "Edi", age: 27, grades: [70.98, 99.42, 100])


print(Student1.showStudentInfo())
print("\n")
print(Student2.showStudentInfo())
print("\n")
print(Student3.showStudentInfo())
