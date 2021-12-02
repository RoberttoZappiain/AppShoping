//
//  Home.swift
//  AppShoping
//
//  Created by Robertto Flores on 30/11/21.
//

import SwiftUI

struct Home: View {
    @Namespace var animation
    @StateObject var homeData: HomeViewModel = HomeViewModel()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 15){
                //Search Bar
                ZStack{
                    if homeData.searchActivated{
                        SearchBar()
                    }else{
                        SearchBar()
                            .matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                    }
                }
                .frame(width: getRect().width / 1.6)
                .padding(.horizontal, 25)
                .contentShape(Rectangle())
                .onTapGesture{withAnimation(.easeInOut){
                    homeData.searchActivated = true
                }}
                
            Text("Ordena en nuestra\ntienda en linea")
                .font(.custom(customFont, size: 28).bold())
                .foregroundColor(Color("Purple"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
                .padding(.horizontal, 25)
                
                //Product Tab
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 18){
                        ForEach(ProductType.allCases, id: \.self){type in
                            
                            //Product Type View
                            ProductTypeView(type: type)
                        }
                    }
                    .padding(.horizontal, 25)
                }
                .padding(.top, 28)
                //Product Page
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 25){
                        ForEach(homeData.filteredProducts){Product in
                            //Product Card View
                            ProductCardView(product: Product)
                        }
                    }
                    .padding(.horizontal,25)
                    .padding(.bottom)
                    .padding(.top, 80)
                }
                .padding(.top,30)
                
                //Botom para mostrar mas
                Button{
                    homeData.ShowMoreProductsOnType.toggle()
                }label: {
                    Label{
                        Image(systemName: "arrow.right")
                    } icon:{
                        Text("Ver todo")
                    }
                    .font(.custom(customFont, size: 15).bold())
                    .foregroundColor(Color("Purple"))
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
                .padding(.top,10)
            }
            .padding(.vertical)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("HomeBG"))
        
        //ACTUALIZACION DATOS CUANDO CAMBIA TAB
        .onChange(of: homeData.productType){
            newValue in homeData.filterProductByType()
        }
        
        //Preview
        .sheet(isPresented: $homeData.ShowMoreProductsOnType){
            
        }content:{
            MoreProductsView()
        }
        
        //Mostrando Search View
        .overlay(
            ZStack{
                if homeData.searchActivated{
                    SearchView(animation: animation)
                        .environmentObject(homeData)
                }
            }
        )
    }
    
    
    
    //Desde aqui se agrega el matched geometry effect
    @ViewBuilder
    func SearchBar()-> some View{
        HStack(spacing: 15){
            Image(systemName: "magnifyingglass")
                .font(.title2)
                .foregroundColor(.gray)
            
            TextField("Search", text: .constant(""))
                .disabled(true)
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .background(
        Capsule()
            .strokeBorder(Color.gray,lineWidth: 0.8)
        )
    }
    
    
    
    @ViewBuilder
    func ProductCardView(product: Product)-> some View{
        VStack(spacing: 10){
            Image(product.ProductImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: getRect().width / 2.5,  height: getRect().width / 2.5)
            
            //Se mueve la imagen a top para que se vea bien
                .offset(y: -80)
                .padding(.bottom, -80)
            
            
            Text(product.title)
                .fontWeight(.semibold)
                .font(.custom(customFont, size: 18))
                .padding(.top)
            
            Text(product.subtitle)
                .font(.custom(customFont, size: 14))
                .foregroundColor(.gray)
            
            Text(product.price)
                .fontWeight(.semibold)
                .font(.custom(customFont, size: 16))
                .foregroundColor(Color("Purple"))
                .padding(.top, 5)
        }
        .padding(.horizontal,20)
        .padding(.bottom, 22)
        .background(
            Color.white
                .cornerRadius(25)
        )
        .padding(.top, 80)
    }
    
    @ViewBuilder
    func ProductTypeView(type: ProductType)->some View{
        Button{
            //UPDATING CURRENT TYPE
            withAnimation{
                homeData.productType = type
            }
        } label: {
            Text(type.rawValue)
                .font(.custom(customFont, size: 15))
                .fontWeight(.semibold)
            //El color cambia dependiendo producto current
                .foregroundColor(homeData.productType == type ? Color("Purple") : Color.gray)
                .padding(.bottom,10)
            //Agregando indicadores debajo
                .overlay (
                    
                    //Agregando Geometry Matched Effect
                    ZStack{
                        if homeData.productType == type{
                            Capsule()
                                .fill(Color("Purple"))
                                .matchedGeometryEffect(id: "PRODUCTTAB", in: animation)
                                .frame(height: 2)
                        }
                        else{
                            Capsule()
                                .fill(Color.clear)
                                .frame(height: 2)
                        }
                    }
                        .padding(.horizontal, -5)
                    ,alignment: .bottom
                )
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
