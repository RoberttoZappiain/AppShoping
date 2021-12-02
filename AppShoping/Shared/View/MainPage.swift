//
//  MainPage.swift
//  AppShoping
//
//  Created by Robertto Flores on 30/11/21.
//

import SwiftUI

struct MainPage: View {
    //Current Tab...
    @State var CurrentTab: Tab = .Home
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        VStack(spacing: 0){
            TabView(selection: $CurrentTab){
                    Home()
                    .tag(Tab.Home)
                Text("Liked")
                    .tag(Tab.Liked)
                Text("Profile")
                    .tag(Tab.Profile)
                Text("Cart")
                    .tag(Tab.Cart)
            }
        //Custom tab bar
            HStack(spacing: 0){
                ForEach(Tab.allCases, id: \.self){tab in
                    Button{
                        //Updating tab
                        CurrentTab = tab
                    }label: {
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                            //Aplicando una pequena sombra
                            .background(
                            Color("Purple")
                                .opacity(0.1)
                                .cornerRadius(5)
                            
                            //Por si se hace grande
                                .padding(-7)
                                .opacity(CurrentTab == tab ? 1 : 0)
                            //Blurring
                                .blur(radius: 5)
                            )
                            .frame(maxWidth: .infinity)
                            .foregroundColor(CurrentTab == tab ?
                                             Color("Purple") : Color.black.opacity(0.3)
                            )
                    }
                }
            }
            .padding([.horizontal,.top])
            .padding(.bottom,10)
        }
        .background(Color("HomeBG").ignoresSafeArea())
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}




//Haciendo case Iterable
//TabCases
enum Tab: String,CaseIterable{
    
    //VALOR FILA DEBE SER NOMBRE IMG
    case Home = "Home"
    case Liked = "Liked"
    case Profile = "Profile"
    case Cart = "Cart"
}
