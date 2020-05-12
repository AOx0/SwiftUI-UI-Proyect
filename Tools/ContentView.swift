//
//  ContentView.swift
//  Tools
//
//  Created by Alejandro D on 03/04/20.
//  Copyright © 2020 Alejandro D. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var config : Data
    
    @ViewBuilder
    var body: some View {
        ZStack{
            Color.startGrad
                .edgesIgnoringSafeArea(.all)

            MainViewX()
                
            
            
            if self.config.alreadyLogedIn == false {
                ZStack{
                    Color.startGrad
                        .edgesIgnoringSafeArea(.all)
                        .opacity(config.alreadyLogedIn ? 0 : 1)
                    VistaInicio()
                        .opacity(config.alreadyLogedIn ? 0 : 1)
                        .offset(y : 20)
                }
            }
            
            
            
        }.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Data())
    }
}

struct MainView: View {
    @EnvironmentObject var config : Data
    var body: some View {
        VStack {
            Text("Logged In")
                .opacity(config.alreadyLogedIn ? 1 : 0)
                .animation(Animation.easeOut(duration: 1).delay(0.5))
                .onTapGesture {
                    withAnimation(){
                        self.config.alreadyLogedIn.toggle()
                    }
            }
        }
    }
}
