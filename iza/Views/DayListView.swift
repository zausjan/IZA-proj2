//
//  DayListView.swift
//  iza
//
//  Created by Jan Zauska on 15/05/2020.
//  Copyright © 2020 Jan Zauska. All rights reserved.
//

import Foundation
import SwiftUI

//historia stravovania
struct DayListView: View {
    var viewModel: HistoryViewModel = HistoryViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            Text("Nutrition history").font(.title)
            VStack {
                ForEach(viewModel.mealHistoryWithoutToday, id: \.0) { dayData in
                    DayView(nutritionForDay: dayData.nutrition, date: dayData.date)
                }
            }
        }
    }
}
