//
//  ProfessorListView.swift
//  MDI1-103
//
//  Created by Isai Magdaleno Almeraz Landeros on 13/12/25.
//

import SwiftUI

struct ProfessorListView: View {
	
	// ----------Variables & States----------
	@State private var professorList: [Professor] = [
		Professor(firstName: "Fernanda", lastName: "Murillo", phone: "664-345-5478"),
		Professor(firstName: "Leo", lastName: "Lopez", phone: "664-364-4819")
	]
	@State private var newFirstName: String = ""
	@State private var newLastName: String = ""
	@State private var newPhone: String = ""
	@State private var newProfessor: String = ""
	@State private var isReverse: Bool = false
	@State private var isSortedAToZ: Bool = false
	@State private var showAlert: Bool = false
	
	// ------Functions & Comp-variables------
	private var displayedProfessors: [Professor] {
		var professors = professorList
		if isSortedAToZ {
			professors.sort {$0.firstName.localizedCaseInsensitiveCompare($1.firstName) == .orderedAscending}
		}
		if isReverse {
			professors.reverse()
		}
		return professors
	}
	
	func addProfessor(firstName: String, lastName: String, phone: String) {
		let first = firstName.trimmingCharacters(in: .whitespacesAndNewlines)
		let last = lastName.trimmingCharacters(in: .whitespacesAndNewlines)
		let phoneClean = phone.trimmingCharacters(in: .whitespacesAndNewlines)

		guard !first.isEmpty else { return }

		let exists = professorList.contains { prof in
			prof.firstName.caseInsensitiveCompare(first) == .orderedSame &&
			prof.lastName.caseInsensitiveCompare(last) == .orderedSame
		}

		if exists {
			showAlert = true
			return
		}

		let candidate = Professor(firstName: first, lastName: last, phone: phoneClean)
		professorList.append(candidate)
	}
	
	// ------------------Body------------------
	var body: some View {
		// Header wraper
		NavigationView {
			
			// Background color wraper
			ZStack {
				Color.gray.opacity(0.1)
					.ignoresSafeArea(.all)
				
				// Content
				VStack {
					
					Text("My Professors 🧑‍🏫")
						.font(.largeTitle)
						.fontWeight(.bold)
						.foregroundStyle(.black)
						.padding()
					
					Spacer()
					
					// List of Items
					List {
						ForEach(displayedProfessors) { professor in
							VStack(alignment: .leading, spacing: 4) {
								Text("\(professor.firstName) \(professor.lastName)")
									.font(.headline)
								Text(professor.phone)
									.font(.subheadline)
									.foregroundStyle(.secondary)
							}
							.padding(.vertical, 4)
						} /// END: ProfessorList ForEach
					} /// END: List
					.scrollContentBackground(.hidden)
					.background(Color.clear)
					
					VStack {
						TextField("Add First name", text: $newFirstName)
							.padding()
							.background(.white)
							.cornerRadius(20)
							.overlay(
								RoundedRectangle(cornerRadius:20)
									.stroke(Color.gray, lineWidth: 1)
									.opacity(0.2)
							)
							.padding(5)
						
						TextField("Add Last name", text: $newLastName)
							.padding()
							.background(.white)
							.cornerRadius(20)
							.overlay(
								RoundedRectangle(cornerRadius:20)
									.stroke(Color.gray, lineWidth: 1)
									.opacity(0.2)
							)
							.padding(5)
						
						HStack {
							TextField("Add Phone", text: $newPhone)
								.padding()
								.background(.white)
								.cornerRadius(20)
								.overlay(
									RoundedRectangle(cornerRadius:20)
										.stroke(Color.gray, lineWidth: 1)
										.opacity(0.2)
								)
								.padding(5)
							
							Button(action: {addProfessor(
								firstName: newFirstName,
								lastName: newLastName,
								phone: newPhone
							)
								newFirstName = ""
								newLastName = ""
								newPhone = ""
								
							}) {
								Image(systemName: "plus")
									.imageScale(.large)
									.padding()
									.background(.blue)
									.foregroundStyle(.white)
									.cornerRadius(30)
							}
							
						} /// END: HStack
					}/// END: VStack
					
					
					.padding()
				} /// END: VStack - Content
			} /// END: ZStack - Background
			
			// Navbar Title
			.navigationBarTitle("Professor List", displayMode: .inline)
			
			// Toolbar
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Menu {
						Button("Sort A → Z") {
							// Sorting Logic
							if isReverse == true {
								isReverse.toggle()
							}
							isSortedAToZ.toggle()
						}
						
						Button("Reversed Order") {
							// Reverse Logic
							if isSortedAToZ == true {
								isSortedAToZ.toggle()
							}
							isReverse.toggle()
						}
					} /// END: Menu
					label: {
						Image(systemName: "arrow.up.arrow.down.circle")
							.imageScale(.large)
					} /// END: Label
				}
			} /// END: toolbarr
			.alert("Duplicate Professor", isPresented: $showAlert) {
				Button("OK", role: .cancel) {}
			} message: {
				Text("Professor already in your list!")
			}
			
			
		} /// END: NavigationView
	} /// END: body
}

#Preview {
    ProfessorListView()
}

