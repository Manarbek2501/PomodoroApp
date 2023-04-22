//
//  SettingView.swift
//  PomodoroApp
//
//  Created by Manarbek Bibit on 22.04.2023.
//

import SwiftUI

struct SettingView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor:UIColor.init(Color(CGColor(red: 1, green: 1, blue: 1, alpha: 1)))]
    }
    @EnvironmentObject var pomodoroModel: PomodoroModel
    @Environment(\.presentationMode) var presentMode
    var body: some View {

            ScrollView {
                ZStack {
                    VStack(spacing: 20,content: {
                        HStack( spacing: 0, content: {
                            Text("Focus time")
                            Spacer()
                            ZStack {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.black)
                                    .opacity(0.3)
                                    .frame(width: 30 ,height: 30)
                                Text("\(pomodoroModel.hour)")
                                    .contextMenu{
                                        selectTimeOptions(maxValue: 12, hint: "hour") { value in
                                            pomodoroModel.hour = value
                                        }
                                    }
                            }
                            Text(":")
                                .bold()
                            ZStack {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.black)
                                    .opacity(0.3)
                                    .frame(width: 30 ,height: 30)
                                Text("\(pomodoroModel.minutes)")
                                    .contextMenu{
                                        selectTimeOptions(maxValue: 59, hint: "minute") { value in
                                            pomodoroModel.minutes = value
                                        }
                                    }
                            }
                            Text(":")
                                .bold()
                            ZStack {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.black)
                                    .opacity(0.3)
                                    .frame(width: 30 ,height: 30)
                                Text("\(pomodoroModel.seconds)")
                                    .contextMenu{
                                        selectTimeOptions(maxValue: 59, hint:"second") { value in
                                            pomodoroModel.seconds = value
                                        }
                                    }
                            }
                        })
                        .foregroundColor(.white)
                        Divider()
                        HStack(content: {
                            Text("Break time")
                            Spacer()
                        })
                        .foregroundColor(.white)
                        Divider()
                    })
                    .padding([.leading, .trailing], 16)
                    .padding(.top)
                }
            }
                .padding()
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                            Button(action: {
                                pomodoroModel.timerValue = "\(pomodoroModel.hour == 0 ? "" : "\(pomodoroModel.hour):")\(pomodoroModel.minutes >= 10 ? "\(pomodoroModel.minutes)" : "0\(pomodoroModel.minutes)"):\(pomodoroModel.seconds >= 10 ? "\(pomodoroModel.seconds)":"0\(pomodoroModel.seconds)")"
                                presentMode.wrappedValue.dismiss()
                            }) {
                                Text("Save")
                            }
                            .disabled(pomodoroModel.seconds == 0)
                            .foregroundColor(pomodoroModel.seconds == 0 ? Color.white : Color.yellow)
                            .padding(.trailing, 9)
                    })
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            presentMode.wrappedValue.dismiss()
                        } ) {
                            Image(systemName: "chevron.backward")
                                .font(.custom("SFProDisplay-Medium", size: 23))
                                .foregroundColor(Color.white)
                        }.frame(width: 18, height: 24)
                    }
                })
            .background(Color(CGColor(red: 0.11, green: 0.11, blue: 0.118, alpha: 1)))
    }
   
    func selectTimeOptions(maxValue: Int, hint: String, onClick: @escaping (Int) -> ()) -> some View {
        VStack {
            ForEach(0...maxValue, id: \.self) {value in
                Button("\(value) \(hint)") {
                    onClick(value)
                }
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .environmentObject(PomodoroModel())
    }
}
