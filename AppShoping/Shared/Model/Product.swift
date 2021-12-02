//
//  Product.swift
//  AppShoping
//
//  Created by Robertto Flores on 30/11/21.
//

import SwiftUI

//Product Model
struct Product: Identifiable,Hashable{
    var id = UUID().uuidString
    var type : ProductType
    var title : String
    var subtitle : String
    var descrption : String = ""
    var price: String
    var ProductImage: String = ""
    var quantity: Int  = 1
}


//Product Type
enum ProductType: String,CaseIterable{
    case Wearable = "Relojes"
    case Laptops = "Laptops"
    case Phones = "Smartphones"
    case Tablets = "Tablets"
}
