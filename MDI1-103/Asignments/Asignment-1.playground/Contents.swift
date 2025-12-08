// --------------Assignment 1--------------
var studentNames: [String] = ["John", "Jane", "Bob", "Alice", "Charlie"]
var studentGrades: [String:[Double]] = [
	"John":[85.0, 90.0, 78.0],
	"Jane":[92.0, 88.0, 95.0],
	"Bob":[78.0, 82.0, 89.0],
	"Alice":[88.0, 91.0, 85.0],
	"Charlie":[95.0, 80.0, 87.0]
]

// Function to calculate average for a student
@MainActor // this is to fix and error of isolation
func studentAverage(_ studentName: String) -> Double {
	guard let grades = studentGrades[studentName] else { return 0.0 } // guard = like a if statemente but cleaner and always returns something
	let sum = grades.reduce(0, +) // reduce = Sumns everitying inside the arary
	return sum / Double(grades.count)
}

// Print individual averages
for name in studentNames {
	let average = studentAverage(name)
		print("\(name): \(String(format: "%.2f", average))")
}
