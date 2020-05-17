//
//  ProfileView.swift
//  iza
//
//  Created by Jan Zauska on 15/05/2020.
//  Copyright © 2020 Jan Zauska. All rights reserved.
//

import SwiftUI

// profil s historiou stravy
struct ProfileView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                HeaderView()
                DayListView()
            }.navigationBarTitle("Nutrition tracker")
        }
    }
}
