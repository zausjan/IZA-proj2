//
//  HeaderView.swift
//  iza
//
//  Created by Jan Zauska on 15/05/2020.
//  Copyright © 2020 Jan Zauska. All rights reserved.
//

import SwiftUI

// header zobrazujuci stravu za dnesny den
struct HeaderView: View {
    var viewModel: HistoryViewModel = HistoryViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image("user_image")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Your nutrition for today")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    
                    HStack(alignment: .firstTextBaseline, spacing: 0) {
                        Text("Calories: ")
                            .fontWeight(.bold)
                        Text("\(Int(viewModel.todayNutrition.calories))")
                    }
                }.padding()
                
            }.padding()
            
            NutritientsView(proteins: viewModel.todayNutrition.proteins, fats: viewModel.todayNutrition.fats, carbs: viewModel.todayNutrition.carbs)
            
        }.background(Color.init(red: 255/255, green: 229/255, blue: 204/255))
            .cornerRadius(25)
    }
}
