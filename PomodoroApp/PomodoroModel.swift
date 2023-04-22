//
//  PomodoroModel.swift
//  PomodoroApp
//
//  Created by Manarbek Bibit on 22.04.2023.
//

import SwiftUI

class PomodoroModel: NSObject ,ObservableObject, UNUserNotificationCenterDelegate {
    
    @Published var isSelectedWork:Bool = false
    @Published var isSelectedStudy:Bool = false
    @Published var isSelectedWorkout:Bool = false
    @Published var isSelectedReading:Bool = false
    @Published var isSelectedMeditation:Bool = false
    @Published var isSelectedOthers:Bool = false
    @Published var chooceBG: BackgroundChoice = .work

    enum BackgroundChoice: String {
        case work = "Work"
        case study = "Study"
        case workout = "Workout"
        case reading = "Reading"
        case meditation = "Meditation"
        case others = "Others"
        
        var backgroundImage: Image {
            switch self {
            case .work:
                return Image("Work")
            case .study:
                return Image("Study")
            case .workout:
                return Image("Workout")
            case .reading:
                return Image("Reading")
            case .meditation:
                return Image("Meditation")
            case .others:
                return Image("Others")
            }
        }
    }
    
    @Published var progress: CGFloat = 1
    @Published var timerValue: String = "00:00"
    @Published var isStarted: Bool = false
    @Published var totalSeconds: Int = 0
    @Published var staticTotalSecond: Int = 0
    
    @Published var hour: Int = 00
    @Published var minutes: Int = 00
    @Published var seconds: Int = 00
    
    @Published var isFinished: Bool = false
    private var timer = Timer()
    
    
    override init() {
        super.init()
        self.AuthNotify()
    }
    
    func AuthNotify() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in
        }
        
        UNUserNotificationCenter.current().delegate = self
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound, .banner])
    }
    
    func startTimer() {
        withAnimation(.easeInOut(duration: 0.25)){
            isStarted = true
        }
        
        timerValue = "\(hour == 0 ? "" : "\(hour):")\(minutes >= 10 ? "\(minutes)" : "0\(minutes)"):\(seconds >= 10 ? "\(seconds)":"0\(seconds)")"
        
        totalSeconds = (hour * 3600) + (minutes * 60) + seconds
        staticTotalSecond = totalSeconds
        addNotify()
    }
    
    func stopTimer() {
        withAnimation {
            isStarted = false
            hour = 0
            minutes = 0
            seconds = 0
            progress = 1
        }
        totalSeconds = 0
        staticTotalSecond = 0
        timerValue = "00:00"
    }
    
    func pauseTimer() {
        
    }
    
    func updateTimer() {
        totalSeconds -= 1
        
        progress = CGFloat(totalSeconds) / CGFloat(staticTotalSecond)
        progress = (progress < 0 ? 0 : progress)
        
        hour = totalSeconds / 3600
        minutes = (totalSeconds / 60) % 60
        seconds = (totalSeconds % 60)
        
        timerValue = "\(hour == 0 ? "" : "\(hour):")\(minutes >= 10 ? "\(minutes)" : "0\(minutes)"):\(seconds >= 10 ? "\(seconds)":"0\(seconds)")"
        
        if hour == 0 && minutes == 0 && seconds == 0 {
            isStarted = false
            isFinished = true
            
        }
    }
    
    func addNotify() {
        let content = UNMutableNotificationContent()
        content.title = "Pomodoro App"
        content.subtitle = "Pomodoro timer is coompleted!"

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(staticTotalSecond), repeats: false))
        
        UNUserNotificationCenter.current().add(request)
    }
}
