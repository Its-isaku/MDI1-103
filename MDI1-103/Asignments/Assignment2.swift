import SwiftUI

struct Assignment2: View {
	// ----------Variables & States----------
	@State private var studentList: [String:[Double]] = [
		"Isai": [99.30, 87.40, 91.10],
		"Sofia": [92.40, 85.30, 88.10],
		"Edi": [87.40, 90.20, 91.10]
	]
	@State private var newItem: String = ""
	@State private var newGrade: String = ""
	@State private var isReverse: Bool = false
	@State private var isSortedAToZ: Bool = false
	
	// ------Functions & Comp-variables------
	
	/// displayList
	var sortedStudentList: [(key: String, value: [Double])] {
		// 1. Convert the dictionary into an array of tuples (key, value)
		let listArray = studentList.sorted { $0.key < $1.key } // Initial Order A -> Z
		
		if isSortedAToZ {
			// If A->Z (ascending) is active
			return listArray
		} else if isReverse {
			// If reversed (descending) is active
			return listArray.reversed()
		} else {
			// Default order (A->Z)
			return listArray
		}
	}
	
	/// gets avarage grade
	var avarageGrade: Double {
		/// makes array of all grades from all students
		let allGrades: [Double] = studentList.flatMap(\.value)
		
		/// returns avg, guarding against division by zero
		guard !allGrades.isEmpty else { return 0.0 }
		let average = allGrades.reduce(0, +) / Double(allGrades.count)
		return average
	}
	
	func addStudent() {
		/// gets student name and eliminates whitespace
		let studentName = newItem.trimmingCharacters(in: .whitespaces)
		
		/// Convert the grade input (String) to a Double
		guard !studentName.isEmpty,
			  let gradeValue = Double(newGrade) else {
			// Do nothing if the name is empty or the grade is not a valid number
			return
		}

		// If the student does not exist, add them with the new grade
		if studentList[studentName] == nil {
			studentList[studentName] = [gradeValue]
		} else {
			// If the student already exists, append the new grade to their list
			studentList[studentName]?.append(gradeValue)
		}
		
		// Clear the input fields
		newItem = ""
		newGrade = ""
	}
	
	var body: some View {
		NavigationView {
			ZStack {
				Color.gray.opacity(0.1)
					.ignoresSafeArea(.all)
				
				VStack {
					
					Text("Gradebook")
						.font(.largeTitle)
						.foregroundStyle(.blue)
						.padding()
					
					Text("Average grade: \(String(format: "%.2f", avarageGrade))")
						.font(.title3)
						.foregroundStyle(.blue)
						.padding(.bottom)
					
					// List of Items
					List {
						// Iterate over the sorted list using the student's name as the unique ID
						ForEach(sortedStudentList, id: \.key) { student in
							HStack {
								Text(student.key) /// student's name
								Spacer()
								Text(student.value.map { String(format: "%.2f", $0) }.joined(separator: ", ")) /// student's grades
									.foregroundColor(.gray)
							}
						} /// END: ForEach
					} /// END: List
					
					HStack {
						TextField("Add Student", text: $newItem)
							.padding()
							.overlay(
								RoundedRectangle(cornerRadius:20)
									.stroke(Color.gray, lineWidth: 1)
									.opacity(0.2)
							)
						
						TextField("Add Grade", text: $newGrade)
							.keyboardType(.decimalPad)
							.frame(width: 100)
							.padding()
							.overlay(
								RoundedRectangle(cornerRadius:20)
									.stroke(Color.gray, lineWidth: 1)
									.opacity(0.2)
							)
							.padding(.trailing)
						
						Button(action: addStudent) {
							Image(systemName: "person.badge.plus")
								.padding()
								.background(.blue)
								.foregroundStyle(.white)
								.cornerRadius(30)
						}
					} /// END: HStack
					.padding([.leading, .trailing, .bottom])
					
				} /// END: VStack - Content
			} /// END: ZStack - Background
			
			// Navbar Title
			.navigationBarTitle("Gradebook", displayMode: .inline)
			
			// Toolbar
			.toolbar {
				Menu {
					Button("Sort A → Z (Ascending)") {
						isReverse = false
						isSortedAToZ = true
					}
					
					Button("Sort Z → A (Descending)") {
						isSortedAToZ = false
						isReverse = true
					}
				} /// END: Menu
				label : {
					Image(systemName: "arrow.up.arrow.down.circle")
						.imageScale(.large)
				} /// END: Label
			} /// END: toolbar
			
		} /// END: NavigationView
	} /// END: body
} /// END: Assignment-2

#Preview {
	Assignment2()
}
