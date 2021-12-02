//
//  StaggeredGrid.swift
//  AppShoping
//
//  Created by Robertto Flores on 01/12/21.
//

import SwiftUI

//CUSTOM VIEW BUILDER
// T -> es para presionar la coleccion de datos que se tienen
//

struct StaggeredGrid<Content: View, T: Identifiable>: View
    where T: Hashable{
    //Esta parte deberia un objeto seleccionado de la coleccion para construir una vista
        var content: (T) -> Content
        
        var list: [T]
        
        //Columnas
        var columns: Int
        
        //Propiedades
        var showsIndicators: Bool
        var spacing: CGFloat
        
        
        init (columns: Int,showsIndicators: Bool = false, spacing: CGFloat = 10, list: [T],@ViewBuilder content: @escaping(T)->Content){
            self.content = content
            self.list = list
            self.spacing = spacing
            self.showsIndicators = showsIndicators
            self.columns = columns
        }
        
        //FUNCION GRID
    func setUpList()->[[T]]{
        
        //Crear empty sub arrais del contador de columnas
        var gridArray: [[T]] = Array(repeating: [], count: columns)
        
        var currentIndex: Int = 0
        for object in list{
            gridArray[currentIndex].append(object)
            
            if currentIndex == (columns - 1){
                currentIndex = 0
                
            }else{
                currentIndex += 1
            }
        }
        return gridArray
    }
    
    var body: some View{
        ScrollView(.vertical, showsIndicators: showsIndicators){
            HStack(alignment: .top){
                ForEach(setUpList(),id: \.self){
                    columnsData in
                    LazyVStack(spacing: spacing){
                        ForEach(columnsData){
                            object in
                            content(object)
                        }
                    }
                }
            }
            .padding(.vertical)
        }
    }
}

struct StaggeredGrid_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
