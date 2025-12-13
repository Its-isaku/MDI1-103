//
//  Professor.swift
//  MDI1-103
//
//  Created by Isai Magdaleno Almeraz Landeros on 13/12/25.
//

import Foundation

class Professor: Identifiable {
	let id = UUID()
	var firstName: String
	var lastName: String
	var phone: String
	
	init(firstName: String, lastName: String, phone: String) {
		self.firstName = firstName
		self.lastName = lastName
		self.phone = phone
	}
}
