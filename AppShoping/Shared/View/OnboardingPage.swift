//
//  OnboardingPage.swift
//  AppShoping
//
//  Created by Robertto Flores on 29/11/21.
//

import SwiftUI

//PARA USAR LAS FUENTES PERSONALIZADAS EN TODAS LAS VISTAS//

let customFont = "Raleway-Regular"

struct OnboardingPage: View {
    
    //CODIGO PARA MOSTRAR LOGIN PAGE
    @State var showLoginPage: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text("Encuentra el mejor\nAccesorio para verte cool")
                .font(.custom(customFont, size: 40))
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Image("OnBoard")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Button{
                withAnimation{
                    showLoginPage = true
                }
            } label:{
                Text("Comencemos")
                    .font(.custom(customFont, size: 18))
                    .fontWeight(.semibold)
                    .padding(.vertical, 18)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .foregroundColor(Color("Purple"))
            }
            .padding(.horizontal, 30)
            //DEPENDE DE LA ALTURA LA FUNCION DEVOLVERA
            .offset(y: getRect().height < 750 ? 20 : 40)
            
            Spacer()
        }
        .padding()
        .padding(.top,getRect().height < 750 ? 0 : 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color("Purple")
            
        )
        .overlay(
            Group{
                if showLoginPage{
                    LoginPage()
                        .transition(.move(edge: .bottom))
                }
            }
        )
    }
}

struct OnboardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage()
    }
}


//FUNCION PARA CAPTURAR EL LARGO DE LA PANTALLA
extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
