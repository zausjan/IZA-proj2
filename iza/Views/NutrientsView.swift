//
//  NutrientsView.swift
//  iza
//
//  Created by Jan Zauska on 17/05/2020.
//  Copyright © 2020 Jan Zauska. All rights reserved.
//

import SwiftUI

// view s makronutrientami
struct NutritientsView: View {
    var proteins: Double
    var fats: Double
    var carbs: Double
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            VStack {
                Text("Proteins")
                    .fontWeight(.bold)
                Text(String(format: "%.1f", proteins) + " g")
            }
            Spacer()
            
            VStack {
                Text("Fats")
                    .fontWeight(.bold)
                
                Text(String(format: "%.1f", fats) + " g")
            }
            Spacer()
            
            VStack {
                Text("Carbs")
                    .fontWeight(.bold)
                
                Text(String(format: "%.1f", carbs) + " g")
            }
        }.padding()
    }
}
