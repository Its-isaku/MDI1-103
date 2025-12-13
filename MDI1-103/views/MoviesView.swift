//
//  MoviesView.swift
//  MDI1-103
//
//  Created by Isai Magdaleno Almeraz Landeros on 10/12/25.
//

import SwiftUI

struct MoviesView: View {
	// ----------Variables & States----------
	@State private var movieList: Set<String> = ["Shrek 2", "Shrek 1"]
	@State private var newItem: String = ""
	@State private var isReverse: Bool = false
	@State private var isSortedAToZ: Bool = false
	@State private var showAlert: Bool = false
	
	// ------Functions & Comp-variables------
    private var displayedMovies: [String] {
        var items = Array(movieList)
        if isSortedAToZ {
            items.sort(by: <)
        }
        if isReverse {
            items.reverse()
        }
        return items
    }
	
	func addMovie() {
		/// 1. Clean Data -> Remove
		let CleanMovie = newItem.trimmingCharacters(in: .whitespacesAndNewlines)
		
		/// 2. if empty, exit
		guard !CleanMovie.isEmpty else { return }
		
		/// 3. If duplicates, alert
		if movieList.contains(CleanMovie) {
			/// Alert user and clean input
			newItem = ""
			showAlert = true
			return
		} else {
			/// if all good, add moview
			movieList.insert(CleanMovie)
		}
		/// Clean the variable
		newItem = ""
	}
	
	
	var body: some View {
		// Header wraper
		NavigationView {
			
			// Background color wraper
			ZStack {
				Color.gray.opacity(0.1)
					.ignoresSafeArea(.all)
				
				// Content
				VStack {
					
					Text("🍿 Fav Movies")
						.font(.largeTitle)
						.fontWeight(.bold)
						.foregroundStyle(.black)
						.padding()
					
					Spacer()
					
//					List of Items
					List {
						ForEach(displayedMovies, id: \.self) { movie in
							Text(movie)
						} /// END: shopingList ForEach
					} /// END: List
					.scrollContentBackground(.hidden)
					.background(Color.clear)
					
					HStack {
						TextField("Add Movie", text: $newItem)
							.padding()
							.background(.white)
							.cornerRadius(20)
							.overlay(
								RoundedRectangle(cornerRadius:20)
									.stroke(Color.gray, lineWidth: 1)
									.opacity(0.2)
							)
							.padding()
						
						Button(action: addMovie) {
							Image(systemName: "plus")
								.imageScale(.large)
								.padding()
								.background(.blue)
								.foregroundStyle(.white)
								.cornerRadius(30)
						}
						
					} /// END: HStack
					.padding()
				} /// END: VStack - Content
			} /// END: ZStack - Background
			
			// Navbar Title
			.navigationBarTitle("Movie List", displayMode: .inline)
			
			// Toolbar
			.toolbar {
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
				label : {
					Image(systemName: "arrow.up.arrow.down.circle")
						.imageScale(.large)
				} /// END: Label
			} /// END: toolbar
			.alert("Duplicate Movie", isPresented: $showAlert) {
				Button("OK", role: .cancel) {}
			} message: {
				Text("Movie already in your list!")
			}
			
			
		} /// END: NavigationView
	} /// END: body
}

#Preview {
    MoviesView()
}
