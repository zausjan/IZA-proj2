//
//  MainView.swift
//  iza
//
//  Created by Jan Zauska on 15/05/2020.
//  Copyright © 2020 Jan Zauska. All rights reserved.
//

import Foundation
import SwiftUI

// tabview pre navigaciu medzi profilom a zoznamom jedal
struct MainView: View {
    var body: some View {
        TabView {
            ProfileView()
                .tabItem {
                    HStack {
                        Image(systemName: "person")
                        Text("Profile")
                    }
            }
            FoodListView()
                .tabItem {
                    HStack {
                        Image(systemName: "hare")
                        Text("Foods")
                    }
            }
        }
    }
}

