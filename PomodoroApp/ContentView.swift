//
//  ContentView.swift
//  PomodoroApp
//
//  Created by Manarbek Bibit on 22.04.2023.
//

import SwiftUI

enum Tabs: Hashable {
    case main
    case settings
    case history
}

struct ContentView: View {
    @State private var selectedTab: Tabs = .main
    @State private var showingCredits = false
    @EnvironmentObject var pomodoroModel: PomodoroModel
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab, content: {
                MainScreenView()
                    .environmentObject(pomodoroModel)
                
                    .tabItem {
                        Label("Main", systemImage: "house")
                        
                    }
                    .tag(Tabs.main)
                
                SettingScreenView()
                    .environmentObject(pomodoroModel)
                    .tabItem {
                        Label("Settings", systemImage: "slider.horizontal.3")
                    }
                    .tag(Tabs.settings)
                
                HistoryScreenView()
                    .tabItem {
                        Label("History", systemImage: "doc")
                    }
                    .tag(Tabs.history)
            })
            .tint(.white)
            }
        .frame(maxHeight: .infinity)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PomodoroModel())
    }
}
