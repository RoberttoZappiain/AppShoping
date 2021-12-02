//
//  MoreProductsView.swift
//  AppShoping
//
//  Created by Robertto Flores on 01/12/21.
//

import SwiftUI

struct MoreProductsView: View {
    var body: some View {
        VStack{
            Text("Todos los\nProductos")
                .font(.custom(customFont, size: 24).bold())
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color("HomeBG").ignoresSafeArea())
    }
}

struct MoreProductsView_Previews: PreviewProvider {
    static var previews: some View {
        MoreProductsView()
    }
}
