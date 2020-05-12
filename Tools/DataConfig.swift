//
//  DataConfig.swift
//  Tools
//
//  Created by Alejandro D on 06/04/20.
//  Copyright © 2020 Alejandro D. All rights reserved.
//
import SwiftUI
import Foundation

extension Color {
    static var startGrad = Color("colo")
    static var endofGrad = Color("colo2")
    static var labels = Color("labels")
    static var menus = Color("menucolor")
    //static var textBut = Color("textButton")
}

class Data : ObservableObject {
    
    
    // MARK: -  General View Data
    @Published var currentModeName : String = UserDefaults.standard.string(forKey: "0xfff01fa") ?? "" {
           didSet {
               UserDefaults.standard.set(self.currentModeName, forKey: "0xfff01fa")
           }
       }
    @Published var currentMode : Int = UserDefaults.standard.integer(forKey: "0xfff01fc") {
        didSet {
            if self.currentMode == 1 {
                self.currentModeName = "Opción 1"
            } else if self.currentMode == 2 {
                self.currentModeName = "Opción 2"
            }
            
            UserDefaults.standard.set(self.currentMode, forKey: "0xfff01fc")
        }
    }
    @Published var menuActive : Bool = false
    
    
    
    
    
    // MARK: -  UserDefaults
    @Published var alreadyLogedIn : Bool = UserDefaults.standard.bool(forKey: "0xfff01f3") {
        didSet{
            UserDefaults.standard.set(self.alreadyLogedIn, forKey: "0xfff01f3")
        }
    }

}

