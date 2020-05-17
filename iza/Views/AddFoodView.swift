//
//  AddFoodView.swift
//  iza
//
//  Created by Jan Zauska on 15/05/2020.
//  Copyright © 2020 Jan Zauska. All rights reserved.
//

import SwiftUI

// vytvorenie noveho jedla
struct AddFoodView : View {
    @State private var name: String = ""
    @State private var protein: String = ""
    @State private var carbs: String = ""
    @State private var fat: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var viewModel: FoodViewModel = FoodViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center) {
                    VStack {
                        Text("NAME")
                        TextField("Fill in the food name", text: $name)
                            .padding(.all)
                            .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                    }
                    .padding(.horizontal, 15)
                    
                    VStack {
                        Text("PROTEINS")
                        TextField("Protein per 100g", text: $protein)
                            .padding(.all)
                            .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                    }
                    .padding(.horizontal, 15)
                    .keyboardType(.decimalPad)
                    
                    VStack {
                        Text("CARBS")
                        TextField("Carbs per 100g", text: $carbs)
                            .padding(.all)
                            .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                    }
                    .padding(.horizontal, 15)
                    .keyboardType(.decimalPad)
                    
                    VStack {
                        Text("FATS")
                        TextField("Fat per 100g", text: $fat)
                            .padding(.all)
                            .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                    }
                    .padding(.horizontal, 15)
                    .keyboardType(.decimalPad)
                    
                    
                    Button(action: {
                        self.viewModel.addNewFood(name: self.name, carbs: Double(self.carbs) ?? 0, proteins: Double(self.protein) ?? 0, fats: Double(self.fat) ?? 0) {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }) {
                        HStack {
                            Image(systemName: "plus")
                                .font(.title)
                            Text("Add")
                                .fontWeight(.semibold)
                                .font(.title)
                                .padding()
                        }
                    }
                }.modifier(DismissingKeyboard())
            }.navigationBarTitle("Add new food")
        }
    }
}
