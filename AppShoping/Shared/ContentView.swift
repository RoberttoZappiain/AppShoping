//
//  ContentView.swift
//  AppShoping
//
//  Created by Robertto Flores on 28/11/21.
//

import SwiftUI

struct ContentView: View {
    //Status Loggeado
    @AppStorage("log_Status") var log_Status: Bool = false
    var body: some View {
        Group{
            if log_Status{
                MainPage()
            }else{
                OnboardingPage()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
