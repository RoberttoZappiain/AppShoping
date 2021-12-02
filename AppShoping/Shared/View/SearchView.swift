//
//  SearchView.swift
//  AppShoping
//
//  Created by Robertto Flores on 01/12/21.
//

import SwiftUI

struct SearchView: View {
    var animation: Namespace.ID
    
    @EnvironmentObject var homeData: HomeViewModel
    
    //ACTIVANDO TEXTI FIELD CON AYUDA DEL FOCUS STATE
    @FocusState var startTF: Bool
    
    var body: some View {
        VStack(spacing: 0){
            //Search Bar
            HStack(spacing: 20){
                Button {
                    withAnimation{
                        homeData.searchActivated = false
                    }
                } label:{
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(Color.black.opacity(0.7))
                }
                //SEARCH BAR
                HStack(spacing: 15){
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    TextField("Search", text: $homeData.searchText)
                        .focused($startTF)
                        .textCase(.lowercase)
                        .disableAutocorrection(true)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                Capsule()
                    .strokeBorder(Color("Purple"),lineWidth: 1.5)
                )
                .matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                .padding(.trailing, 20)
            }
            .padding([.horizontal])
            .padding(.top)
            
            //Filtro de Resultados
            ScrollView(.vertical, showsIndicators: false){
                //Rejillas
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("HomeBG").ignoresSafeArea())
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                startTF = true
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
