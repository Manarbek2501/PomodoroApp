//
//  BottomSheet.swift
//  PomodoroApp
//
//  Created by Manarbek Bibit on 22.04.2023.
//

import SwiftUI

struct BottomSheet: View {
    @Binding var showBottomSheet: Bool
    @ObservedObject var pomodoroModel: PomodoroModel
    var body: some View {
        if showBottomSheet {
            bottomSheet()
                .background(Color(CGColor(red: 0, green: 0, blue: 0, alpha: 0.4)).edgesIgnoringSafeArea(.all))
                .toolbar(.hidden, for: .tabBar)
                .edgesIgnoringSafeArea(.bottom)
        }
    }
    func bottomSheet() -> some View {
        GeometryReader { geo in
            ZStack(content: {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                VStack(spacing: 12) {
                    HStack{
                        Spacer()
                        Text("Focus Category")
                            .font(.system(size: 16, weight: .medium))
                        Spacer()
                        Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .frame(width: 15, height: 15)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                showBottomSheet = false
                            }
                        }
                    }
                    VStack(spacing: 20) {
                        HStack{
                            Button("Work", action: {
                                pomodoroModel.isSelectedWork.toggle()
                                pomodoroModel.chooceBG = .work
                            })
                            .frame(width: 172, height: 60)
                            .foregroundColor( pomodoroModel.isSelectedWork ? Color.white : Color.black)
                            .background(pomodoroModel.isSelectedWork ? Color(CGColor(red: 0.184, green: 0.184, blue: 0.2, alpha: 1)) : Color(CGColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 1)))
                            .cornerRadius(16)
                            
                            Button("Study", action: {
                                pomodoroModel.isSelectedStudy.toggle()
                                pomodoroModel.chooceBG = .study
                            })
                            .frame(width: 172, height: 60)
                            .foregroundColor( pomodoroModel.isSelectedStudy ? Color.white : Color.black)
                            .background(pomodoroModel.isSelectedStudy ? Color(CGColor(red: 0.184, green: 0.184, blue: 0.2, alpha: 1)) : Color(CGColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 1)))
                            .cornerRadius(16)
                            
                            
                        }
                        HStack{
                            Button("Workout", action: {
                                pomodoroModel.isSelectedWorkout.toggle()
                                pomodoroModel.chooceBG = .workout
                            })
                            .frame(width: 172, height: 60)
                            .foregroundColor( pomodoroModel.isSelectedWorkout ? Color.white : Color.black)
                            .background(pomodoroModel.isSelectedWorkout ? Color(CGColor(red: 0.184, green: 0.184, blue: 0.2, alpha: 1)) : Color(CGColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 1)))
                            .cornerRadius(16)
                            
                            Button("Reading", action: {
                                pomodoroModel.isSelectedReading.toggle()
                                pomodoroModel.chooceBG = .reading
                            })
                            .frame(width: 172, height: 60)
                            .foregroundColor( pomodoroModel.isSelectedReading ? Color.white : Color.black)
                            .background(pomodoroModel.isSelectedReading ? Color(CGColor(red: 0.184, green: 0.184, blue: 0.2, alpha: 1)) : Color(CGColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 1)))
                            .cornerRadius(16)
                        }
                        HStack{
                            Button("Meditation", action: {
                                pomodoroModel.isSelectedMeditation.toggle()
                                pomodoroModel.chooceBG = .meditation
                            })
                            .frame(width: 172, height: 60)
                            .foregroundColor( pomodoroModel.isSelectedMeditation ? Color.white : Color.black)
                            .background(pomodoroModel.isSelectedMeditation ? Color(CGColor(red: 0.184, green: 0.184, blue: 0.2, alpha: 1)) : Color(CGColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 1)))
                            .cornerRadius(16)
                            
                            Button("Others", action: {
                                pomodoroModel.isSelectedOthers.toggle()
                                pomodoroModel.chooceBG = .others
                            })
                            .frame(width: 172, height: 60)
                            .foregroundColor( pomodoroModel.isSelectedOthers ? Color.white : Color.black)
                            .background(pomodoroModel.isSelectedOthers ? Color(CGColor(red: 0.184, green: 0.184, blue: 0.2, alpha: 1)) : Color(CGColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 1)))
                            .cornerRadius(16)
                        }
                    }
                    .padding(.top, 30)
                }
                .padding([.leading, .trailing], 16)
                .padding(.bottom, 20)
            })
            .frame(height: 362)
            .frame(width: geo.size.width, height: geo.size.height / 2)
            .offset(y: geo.size.height / 1.85)
        }
        .edgesIgnoringSafeArea(.all)
        .transition(.move(edge: .bottom))
        .animation(.easeIn)
    }
}
