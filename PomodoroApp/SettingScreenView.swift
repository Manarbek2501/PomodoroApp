//
//  SettingScreenView.swift
//  PomodoroApp
//
//  Created by Manarbek Bibit on 22.04.2023.
//

import SwiftUI

struct SettingScreenView: View {
    @EnvironmentObject var pomodoroModel: PomodoroModel
        init() {
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor:UIColor.init(Color(CGColor(red: 1, green: 1, blue: 1, alpha: 1)))]
        }
        
        var body: some View {
            
            NavigationView(content: {
                ScrollView {
                    ZStack {
                        VStack(spacing: 20,content: {
                            NavigationLink(destination: SettingView()) {
                                HStack(spacing: 0, content: {
                                    Text("Focus time")
                                        .foregroundColor(.white)
                                    Spacer()
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 4)
                                            .fill(Color.black)
                                            .opacity(0.3)
                                            .frame(width: 30 ,height: 30)
                                        Text("\(pomodoroModel.hour)")
                                    }
                                    Text(":")
                                        .bold()
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 4)
                                            .fill(Color.black)
                                            .opacity(0.3)
                                            .frame(width: 30 ,height: 30)
                                        Text("\(pomodoroModel.minutes)")
                                    }
                                    Text(":")
                                        .bold()
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 4)
                                            .fill(Color.black)
                                            .opacity(0.3)
                                            .frame(width: 30 ,height: 30)
                                        Text("\(pomodoroModel.seconds)")
                                    }
                                })
                                .foregroundColor(Color(CGColor(red: 0.922, green: 0.922, blue: 0.961, alpha: 0.6)))
                                .padding(.top, 15)
                            }
                            Divider()
                            NavigationLink(destination: SettingView()) {
                                HStack(content: {
                                    Text("Break time")
                                        .foregroundColor(.white)
                                    Spacer()
                                })
                                .padding(.top, 15)
                            }
                            Divider()
                        })
                        .padding([.leading, .trailing], 16)
                    }
                }
                    .padding()
                    .background(Color(CGColor(red: 0.11, green: 0.11, blue: 0.118, alpha: 1)))
                    .navigationTitle("Settings")
                    .navigationBarTitleDisplayMode(.inline)
            })
            .environment(\.colorScheme, .dark)
        }
    }

struct SettingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SettingScreenView()
            .environmentObject(PomodoroModel())
    }
}

