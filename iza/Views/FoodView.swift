//
//  FoodView.swift
//  iza
//
//  Created by Jan Zauska on 15/05/2020.
//  Copyright © 2020 Jan Zauska. All rights reserved.
//

import Foundation
import SwiftUI

// view jedneho jedla
struct FoodView: View {
    @State private var showPopover: Bool = false
    @State private var mealSize: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var food: Food
    var viewModel: FoodViewModel = FoodViewModel()
    var body: some View {
        VStack {
            HStack {
                Image("food")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                    .padding()
                
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(food.name ?? "---")
                        .fontWeight(.bold)
                        .truncationMode(.tail)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    HStack {
                        Image(systemName: "bolt.circle")
                        VStack {
                            Text("Calories")
                                .fontWeight(.bold)
                            Text(String(format: "%.1f", food.getCalories()))
                        }
                        Spacer()
                    }
                    
                }.padding()
                Spacer()
            }
            
            NutritientsView(proteins: food.proteins, fats: food.fats, carbs: food.carbs)
            
            Button("Add") {
                self.showPopover = true
            }.popover(
                isPresented: self.$showPopover,
                arrowEdge: .bottom
            ) {
                VStack {
                    Text("Insert weight (g)")
                    TextField("meal weight", text: self.$mealSize)
                        .padding(.all)
                        .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                        .keyboardType(.decimalPad)
                        .padding()
                    
                    HStack {
                        
                        Button("Cancel")  {
                            self.showPopover = false
                        }.padding()
                        
                        Button("Add meal")  {
                            self.viewModel.addMeal(weight: Int64(self.mealSize) ?? 0, foodId: self.food.objectID) {
                                self.showPopover = false
                            }
                        }.padding()
                    }
                }.modifier(DismissingKeyboard())
                
            }.padding()
        }.background(Color.init(red: 204/255, green: 255/255, blue: 255/255)).cornerRadius(10).padding()
    }
}

