//
//  PomodoroAppApp.swift
//  PomodoroApp
//
//  Created by Manarbek Bibit on 22.04.2023.
//

import SwiftUI

@main
struct PomodoroAppApp: App {
    @StateObject var pomodoroModel: PomodoroModel = .init()
    @Environment(\.scenePhase) var scenePhase
    @State var lastActive: Date = Date()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pomodoroModel)
        }
        .onChange(of: scenePhase) { newValue in
            if pomodoroModel.isStarted {
                if newValue == .background {
                    lastActive = Date()
                }
                
                if newValue == .active {
                    let currentTime = Date().timeIntervalSince(lastActive)
                    if pomodoroModel.totalSeconds - Int(currentTime) <= 0 {
                        pomodoroModel.isStarted = false
                        pomodoroModel.totalSeconds = 0
                        pomodoroModel.isFinished = true
                    } else {
                        pomodoroModel.totalSeconds -= Int(currentTime)
                    }
                }
            }
        }
    }
}
