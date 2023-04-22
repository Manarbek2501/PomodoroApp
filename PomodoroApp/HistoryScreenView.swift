//
//  HistoryScreenView.swift
//  PomodoroApp
//
//  Created by Manarbek Bibit on 22.04.2023.
//

import SwiftUI

struct HistoryScreenView: View {
        
        init() {
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor:UIColor.init(Color(CGColor(red: 1, green: 1, blue: 1, alpha: 1)))]
        }
        
        var body: some View {
            
            NavigationView(content: {
                ScrollView {
                    ZStack {
                        VStack(spacing: 32,content: {
                            sectionTitle(text: "21.11.21")
                            sectionTitle(text: "20.11.21")
                            sectionTitle(text: "19.11.21")
                        })
                    }
                }.padding()
                    .background(Color(CGColor(red: 0.11, green: 0.11, blue: 0.118, alpha: 1)))
                    .navigationTitle("History")
                    .navigationBarTitleDisplayMode(.inline)
            }).environment(\.colorScheme, .dark)
            
        }
    }


extension View {
    func clockText(time: String) -> some View {
        ZStack {
            VStack{
                Text(time)
                    .font(.custom("SFProDisplay-Bold", size: 44))
                Text("Focus on your task")
                    .font(.custom("SFProDisplay-Regular", size: 16))
            } .foregroundColor(.white)
            self
        }
    }
}
extension View {
    func sectionTitle(text: String) -> some View {
        VStack(alignment: .leading, content: {
            Section(text, content: {
                VStack(spacing: 20,content: {
                    sections(textTimer: "Focus time", textTime: "25:00")
                    Divider()
                    sections(textTimer: "Break time", textTime: "05:00")
                    Divider()
                })
            })
        })
    }
}
extension View {
    func sections(textTimer: String, textTime: String) -> some View {
        HStack(content: {
            Text(textTimer).foregroundColor(.white)
            Spacer()
            Text(textTime).foregroundColor(Color(CGColor(red: 0.922, green: 0.922, blue: 0.961, alpha: 0.6)))
        }).padding(.top, 15)
    }
}

struct HistoryScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryScreenView()
    }
}
