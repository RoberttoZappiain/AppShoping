//
//  LoginPageModel.swift
//  AppShoping
//
//  Created by Robertto Flores on 29/11/21.
//

import SwiftUI

class LoginPageModel: ObservableObject {
    // LOGIN PROPIEDADES
    @Published var email: String = ""
    @Published var password : String = ""
    @Published var showPassword : Bool = false
    
    // PROPIEDADES REGISTRO
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password : String = ""
    @Published var showReEnterPassword : Bool = false
    
    //Status Login
    @AppStorage("log_Status") var log_Status: Bool = false
    
    //Login Call
    func Login(){
        //Acciones
        withAnimation{
            log_Status = true
        }
    }
    
    func Register(){
        withAnimation{
            log_Status = true
        }
    }
    
    func ForgotPassword(){
        
    }
}
