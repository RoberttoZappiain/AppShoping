//
//  LoginPage.swift
//  AppShoping
//
//  Created by Robertto Flores on 29/11/21.
//

import SwiftUI

struct LoginPage: View {
    @StateObject var loginData: LoginPageModel = LoginPageModel()
    var body: some View {
        VStack{
        
                Text("Bienvenido\nIngresa tus datos")
                    .font(.custom(customFont, size: 55).bold())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .frame(height: getRect().height / 3.5)
                    .padding()
                    .background(
                        ZStack{
                            //GRADIANTES CIRCULARES
                            LinearGradient(colors: [
                            Color("LoginCircle"),
                            Color("LoginCircle")
                                .opacity(0.8),
                            Color("Purple")
                            ], startPoint: .top, endPoint: .bottom)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                .padding(.trailing)
                                .offset(y: -25)
                                .ignoresSafeArea()
                            
                            Circle()
                                .strokeBorder(Color.white.opacity(0.3),lineWidth: 3)
                                .frame(width: 30, height: 30)
                                .blur(radius: 2)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                                .padding(30)
                            
                            Circle()
                                .strokeBorder(Color.white.opacity(0.3),lineWidth: 3)
                                .frame(width: 23, height: 23)
                                .blur(radius: 2)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                .padding(.leading, 30)
                        }
                    )
            
            ScrollView(.vertical, showsIndicators: false){
             //Login Page Form
                VStack(spacing: 15){
                    Text(loginData.registerUser ? "Registrate" :"Login")
                        .font(.custom(customFont, size: 22).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    // CUSTOM TEXT FIELD
                    CustomTextField( icon: "envelope", title: "Email", hint: "ceteos.com.mx", value: $loginData.email, showPassword:
                        .constant(false))
                        .padding(.top,30)
                    
                    CustomTextField( icon: "lock", title: "Password", hint: "123456", value: $loginData.password, showPassword: $loginData.showPassword)
                        .padding(.top,10)
                    
                   //REGISTRO CAMPO RE ENTER PASS
                    if loginData.registerUser{
                        CustomTextField( icon: "lock", title: "Password", hint: "123456", value: $loginData.re_Enter_Password, showPassword: $loginData.showReEnterPassword)
                            .padding(.top,10)
                    }
                    
                    //FORGOT  PASSWORD BUTTON
                    Button {
                        loginData.ForgotPassword()
                    } label: {
                        Text("Olvido su contraseña?")
                            .font(.custom(customFont, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Purple"))
                    }
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    //LOGIN BOTON
                    
                    Button {
                        if loginData.registerUser{
                            loginData.Register()
                        }else{
                            loginData.Login()
                        }
                    } label: {
                        Text("Login")
                            .font(.custom(customFont, size: 17).bold())
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(Color("Purple"))
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
                    }
                    .padding(.top, 25)
                    .padding(.horizontal)
                    
                    
                    
                    //REGISTER USER BUTTON
                    Button {
                        withAnimation{
                            loginData.registerUser.toggle()
                        }
                    } label: {
                        Text(loginData.registerUser ? "Volver al inicio" : "Crea tu cuenta aqui?")
                            .font(.custom(customFont, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Purple"))
                    }
                    .padding(.top, 8)
                    
                }
                .padding(30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.white
                
                //APLICANDO EL CUSTOMCORNER DEPENDIENDO LA PANTALLA
                    .clipShape(CustomCorners(corners: [.topLeft,.topRight], radius: 25))
                    .ignoresSafeArea()
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Purple"))
        
        //LIMPIANDO DATOS DE CUANDO CAMBIA
        .onChange(of: loginData.registerUser){ newValue in
            loginData.email = ""
            loginData.password = ""
            loginData.re_Enter_Password = ""
            loginData.showPassword = false
            loginData.showReEnterPassword = false
        }
        
    }
    @ViewBuilder
    func CustomTextField(icon: String, title: String, hint: String, value: Binding<String>, showPassword: Binding<Bool>)->some View{
        
        VStack(alignment: .leading, spacing: 12){
            Label {
                Text(title)
                    .font(.custom(customFont, size: 14))
            } icon: {
                Image(systemName: icon)
            }
            .foregroundColor(Color.black.opacity(0.8))
            
            if title.contains("Password") && !showPassword.wrappedValue{
                SecureField(hint, text: value)
                    .padding(.top, 2)
            }else{
                TextField(hint, text: value)
                    .padding(.top, 2)
            }
            
            Divider()
                .background(Color.black.opacity(0.4))
            
        }
        
        //MUESTRA SHOW BOTON PARA CONTRASEÑAS
        .overlay(
            
            Group{
                if title.contains("Password") {
                    Button(action: {
                        showPassword.wrappedValue.toggle()
                    }, label: {
                        Text(showPassword.wrappedValue ? "Ocultar" : "Mostrar")
                            .font(.custom(customFont, size: 13).bold())
                            .foregroundColor(Color("Purple"))
                    })
                        .offset(y:8)
                }
            }
            
           
                ,alignment: .trailing
        )
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
            .previewDevice("iPhone 12")
        LoginPage()
            .previewDevice("iPhone 8")
    }
}
