//
//  ShopingListView.swift
//  MDI1-103
//
//  Created by Isai Magdaleno Almeraz Landeros on 08/12/25.
//

import SwiftUI

struct ShoppingListView: View {
	// ----------Variables & States----------
	@State private var shoppingList: [String] = ["Eggs", "Bannanas", "Apples"]
	@State private var newItem: String = ""
	@State private var isReverse: Bool = false
	@State private var isSortedAToZ: Bool = false
	// ------Functions & Comp-variables------
	
	/// displayList
	
	
    var body: some View {
		// Header wraper
		NavigationView {
			
			// Background color wraper
			ZStack {
				Color.gray.opacity(0.1)
					.ignoresSafeArea(.all)
				
				// Content
				VStack {
					
					Text("Grocery List")
						.font(.largeTitle)
						.foregroundStyle(.blue)
						.padding()
					
					// List of Items
					List {
						ForEach(shoppingList, id: \.self) { item in
							Text(item)
							
						} /// END: shopingList ForEach
					} /// END: List
					
					HStack {
						TextField("Add Item", text: $newItem)
							.padding()
							.overlay(
								RoundedRectangle(cornerRadius:20)
									.stroke(Color.gray, lineWidth: 1)
									.opacity(0.2)
							)
							.padding()
						
						Button(action: {
							// Logic to add an item to the shopingList
							if !newItem.isEmpty {
								shoppingList.append(newItem)
								if isSortedAToZ {
									shoppingList = shoppingList.sorted()
								} else if isReverse {
									shoppingList = Array(shoppingList.reversed())
								}
								newItem = ""
							}
							
						}) { Image(systemName: "arrowshape.up.fill")
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
			.navigationBarTitle("My Shoping App", displayMode: .inline)
			
			// Toolbar
			.toolbar {
				Menu {
					Button("Sort A → Z") {
						// Sorting Logic
						if isReverse == true {
							isReverse.toggle()
						}
						isSortedAToZ.toggle()
						shoppingList = shoppingList.sorted()
					}
					
					Button("Reversed Order") {
						// Reverse Logic
						if isSortedAToZ == true {
							isSortedAToZ.toggle()
						}
						isReverse.toggle()
						shoppingList = Array(shoppingList.reversed())
					}
				} /// END: Menu
				label : {
					Image(systemName: "arrow.up.arrow.down.circle")
						.imageScale(.large)
				} /// END: Label
			} /// END: toolbar
			
		} /// END: NavigationView
	} /// END: body
} /// END:  ShopingListView

#Preview {
    ShoppingListView()
}
