//
//  CCGenView.swift
//  Tools
//
//  Created by Alejandro D on 10/04/20.
//  Copyright © 2020 Alejandro D. All rights reserved.
//

import SwiftUI


struct MainViewX: View {
    @EnvironmentObject var config : Data
    @State private var currentPosition: CGSize = .zero
    @ViewBuilder
    var body: some View {
        ZStack {
            
            // MARK: - Views
            VistaOpción1()
                .blur(radius: self.config.menuActive ? 20 : 0)
                .opacity(self.config.currentMode == 1 ? 1.0 : 0)
            
            VistaOpción2()
                .blur(radius: self.config.menuActive ? 20 : 0)
                .opacity(self.config.currentMode == 2 ? 1.0 : 0)
            

                
            ////////////////////////
            ZStack {
                MenuButton()
            }.blur(radius: self.config.menuActive ? 20 : 0)
            .onTapGesture {
                withAnimation(){
                    self.config.menuActive.toggle()
                }
            }
            MainViewViewM()
                .offset(x: self.config.menuActive ? self.currentPosition.width : -300.0)
                .gesture (
                    DragGesture()
                        .onChanged { value in
                            if value.translation.width < 0{
                                self.currentPosition = value.translation
                            }
                    }
                    .onEnded { value in
                        if value.translation.width < -10 {
                            withAnimation {
                                self.config.menuActive = false
                            }
                            self.currentPosition = CGSize.zero
                        } else {
                            self.currentPosition = CGSize.zero
                        }
                    }
            )
                

        }
    }
}


struct MenuButton: View {
    @EnvironmentObject var config : Data
    @ViewBuilder
    var body: some View {
        VStack {
            HStack {
                Image("Image-1").resizable().frame(width: 25.0, height: 25.0)
                Rectangle()
                    .frame(width: 2.5, height: 25.0)
                Text("\(self.config.currentModeName)")
                    .font(.custom("RobotoMono-Bold", size: 20.0))
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}



struct MainViewViewM: View {
    @EnvironmentObject var config : Data
    @ViewBuilder
    var body: some View {
        GeometryReader { value in
            HStack {
                ZStack {
                    Color.menus
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        HStack {
                            Text("Menu")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                            Spacer()
                        }.padding()
                        
                        
                        HStack {
                            VStack(spacing: 10.0) {
                                Button(action: {
                                    self.config.currentMode = 1
                                    withAnimation(){
                                        self.config.menuActive.toggle()
                                    }
                                }) {
                                    HStack {
                                        Text("Opción 1").foregroundColor(Color.labels)
                                        Spacer()
                                    }
                                }
                                Divider()
                                Button(action: {
                                    self.config.currentMode = 2
                                    withAnimation(){
                                        self.config.menuActive.toggle()
                                    }
                                }) {
                                    HStack {
                                        Text("Opción 2").foregroundColor(Color.labels)
                                        Spacer()
                                    }
                                }
                            }
                            Spacer()
                            
                        }.padding()
                        Spacer()
                        Button(action: {
                            withAnimation(){
                                self.config.menuActive.toggle()
                            }
                        }) {
                            Text("")
                        }.padding()
                            .offset(y: -20)
                        .disabled(true)
                        
                    }
                }
                .frame(width: (value.size.width / 2.5) )
                .edgesIgnoringSafeArea([.bottom, .trailing])
                //.edgesIgnoringSafeArea(.all)
                Spacer()
            }.opacity(self.config.menuActive ? 1.0 : 0)
        }
    }
}
