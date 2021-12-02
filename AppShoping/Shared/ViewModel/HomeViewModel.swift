//
//  HomeViewModel.swift
//  AppShoping
//
//  Created by Robertto Flores on 30/11/21.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var productType: ProductType = .Wearable
    
    @Published var products: [Product] = [
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 6", price: "$349", ProductImage: "AppleWatch6"),
        Product(type: .Wearable, title: "Samsung Watch", subtitle: "Gear Black", price: "$180", ProductImage: "SamsungWatch"),
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 4", price: "$250", ProductImage: "AppleWatch4"),
        Product(type: .Phones, title: "iPhone 13", subtitle: "A15 5G", price: "$699", ProductImage: "iPhone13"),
        Product(type: .Phones, title: "iPhone 12", subtitle: "A14 5G", price: "$599", ProductImage: "iPhone12"),
        Product(type: .Phones, title: "iPhone 11", subtitle: "A13", price: "$499", ProductImage: "iPhone11"),
        Product(type: .Phones, title: "iPhone SE", subtitle: "A13", price: "$399", ProductImage: "iPhoneSE"),
        Product(type: .Laptops, title: "MacBook Air", subtitle: "M1", price: "$999", ProductImage: "MacBookAir"),
        Product(type: .Laptops, title: "MacBook Pro", subtitle: "M1", price: "$1299", ProductImage: "MacBookPro"),
        Product(type: .Tablets, title: "Ipad Pro", subtitle: "M1", price: "$999", ProductImage: "iPadPro"),
        Product(type: .Tablets, title: "Ipad Air 4", subtitle: "A14", price: "$699", ProductImage: "iPadAir"),
        Product(type: .Tablets, title: "Ipad Mini", subtitle: "A15", price: "$599", ProductImage: "iPadMini"),
        Product(type: .Laptops, title: "iMac", subtitle: "M1", price: "$1599", ProductImage: "iMac")
    ]
    
    //Filtro de productos
    @Published var filteredProducts: [Product] = []
    
    //Mostrar Todo
    @Published var ShowMoreProductsOnType: Bool = false
    
    //Datos de Busqueda
    @Published var searchText: String = ""
    @Published var searchActivated: Bool = false

    
    init(){
        filterProductByType()
    }
    
    func filterProductByType(){
        //Filtrando productos por tipo de producto
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.products
            //Desde aqui vamos a requerir mas memoria asi que usaremos lazy para un uso correcto
                .lazy
                .filter{ product in
                    return product.type == self.productType
                }
            //Limitando resultados
                .prefix(4)
            
            DispatchQueue.main.async {
                self.filteredProducts = results.compactMap({ product in
                    return product
                })
            }
        }
    }
    
}

