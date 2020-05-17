//
//  FoodListView.swift
//  iza
//
//  Created by Jan Zauska on 15/05/2020.
//  Copyright © 2020 Jan Zauska. All rights reserved.
//
import SwiftUI

// zoznam jedal
struct FoodListView: View {
    @FetchRequest(
        entity: Food.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Food.name, ascending: true),
        ]
    )
    var foods: FetchedResults<Food>
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .center, spacing: 0) {
                        ForEach(foods, id: \.self) { food in
                            FoodView(food: food)
                        }
                        
                    }
                }
                .navigationBarTitle("Your foods")
                
                NavigationLink(destination: AddFoodView()) {
                    HStack {
                        Image(systemName: "plus")
                            .font(.title)
                        Text("Add new food")
                            .fontWeight(.semibold)
                            .font(.title)
                    }.padding()
                }
            }
        }
    }
}
