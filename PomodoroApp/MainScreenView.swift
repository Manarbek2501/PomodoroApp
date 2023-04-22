//
//  MainScreenView.swift
//  PomodoroApp
//
//  Created by Manarbek Bibit on 22.04.2023.
//

import SwiftUI

struct MainScreenView: View {
    @State var showBottomSheet: Bool = false
    @EnvironmentObject var pomodoroModel: PomodoroModel
    var body: some View {
        ZStack {
            pomodoroModel.chooceBG.backgroundImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.vertical)
            VStack(spacing: 60) {
                focusCategoryButton
                    .onTapGesture {
                        showBottomSheet.toggle()
                    }
                ZStack {
                    Circle()
                        .stroke(.white, lineWidth: 6)
                        .frame(width: 248, height: 248)
                    
                    Circle()
                        .trim(from: 0, to: pomodoroModel.progress)
                        .stroke(.gray, lineWidth: 6)
                        .frame(width: 248, height: 248)
                        .rotationEffect(.init(degrees: -90))
                        .animation(.linear, value: pomodoroModel.progress)
                    ZStack {
                        VStack{
                            Text(pomodoroModel.timerValue)
                                .font(.custom("SFProDisplay-Bold", size: 44))
                                .animation(.none, value: pomodoroModel.progress)
                            Text("Focus on your task")
                                .font(.custom("SFProDisplay-Regular", size: 16))
                        } .foregroundColor(.white)
                    }
                }
                
                HStack(spacing: 80 ,content: {
                    PlayOrPauseButton(icon: !pomodoroModel.isStarted ? "play" : "pause", action: {
                        if pomodoroModel.isStarted {
                            pomodoroModel.pauseTimer()
                            
                        } else {
                            pomodoroModel.startTimer()
                        }
                    })
                    PlayOrPauseButton(icon: "stop.fill", action: {
                        pomodoroModel.stopTimer()
                        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                    })
                })
            }
            BottomSheet(showBottomSheet: $showBottomSheet, pomodoroModel: pomodoroModel)
        }
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
            if pomodoroModel.isStarted {
                pomodoroModel.updateTimer()
            }
        }
        .alert("Focus time is finished!!!", isPresented: $pomodoroModel.isFinished) {
            Button("Go to Break", role: .cancel) {
                pomodoroModel.stopTimer()
            }
            Button("Close", role: .destructive) {
                pomodoroModel.stopTimer()
            }
        }
    }
    
    var focusCategoryButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.gray.opacity(0.6))
                .frame(width: 170, height: 36)
            HStack {
                Image(systemName: "pencil")
                Text("Focus Category")
            }
            .foregroundColor(.white)
            .font(.system(size: 16, weight: .medium))
        }
    }
}

struct PlayOrPauseButton: View {
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Image(systemName: icon)
                .foregroundColor(.white)
        }).frame(width: 56, height: 56)
            .background(RoundedRectangle(cornerRadius: 100).fill(Color.gray.opacity(0.9)))
    }
}


struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
            .environmentObject(PomodoroModel())
    }
}

