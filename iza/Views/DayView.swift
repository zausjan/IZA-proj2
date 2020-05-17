//
//  DayView.swift
//  iza
//
//  Created by Jan Zauska on 15/05/2020.
//  Copyright © 2020 Jan Zauska. All rights reserved.
//

import SwiftUI

// prehlad stravy za den
struct DayView: View {
    var nutritionForDay: NutritionModel
    var date: Date
    
    var dateFormatter: DateFormatter
    
    init(nutritionForDay: NutritionModel, date: Date) {
        self.nutritionForDay = nutritionForDay
        self.date = date
        
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
    }
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "clock")
                Text("Date:")
                Text(dateFormatter.string(from: date))
            }
            
            Image("food")
                .resizable()
                .clipShape(Circle())
                .frame(width: 50, height: 50)
                .padding()
            VStack {
                Text("\(Int(nutritionForDay.calories)) kCal").fontWeight(.bold)
            }.padding()
            
            NutritientsView(proteins: nutritionForDay.proteins, fats: nutritionForDay.fats, carbs: nutritionForDay.carbs)
        
        }
        .padding()
        .background(Color.init(red: 255/255, green: 255/255, blue: 204/255))
        .cornerRadius(10)
        .padding()
    }
}
