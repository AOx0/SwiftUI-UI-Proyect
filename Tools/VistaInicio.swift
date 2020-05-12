//
//  LoginView2.swift
//  Tools
//
//  Created by Alejandro D on 03/04/20.
//  Copyright © 2020 Alejandro D. All rights reserved.
//

import SwiftUI

struct VistaInicio: View {
    @EnvironmentObject var config : Data
    @State var userInput : String = ""
    @State var passInput : String = ""
    @State var showAlert : Bool = false
    
    @ViewBuilder
    var body: some View {
        ZStack {
            Color.startGrad
                .edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors: [Color.startGrad, Color.endofGrad]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.bottom).offset(y : 250)
            
            VStack {
                
                Text("Bienvenido")
                .font(.custom("RobotoMono-Bold", size: 30.0))
                
                
                Button(action: {
                    self.config.currentMode = 1
                    
                    withAnimation(Animation.easeOut.delay(0.5)){
                        self.config.alreadyLogedIn = true
                    }
                }) {
                    ZStack {
                        Color.labels.frame(width: 320, height: 35).cornerRadius(20.0)
                        Text("Continuar")
                            .fontWeight(.bold)
                            .foregroundColor(Color("textButton"))
                    }
                }
            }
        }
    }
}

