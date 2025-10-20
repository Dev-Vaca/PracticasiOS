//
//  imageExample.swift
//  CursoIOS
//
//  Created by Julio César Vaca García on 25/09/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct imageExample: View {
    var body: some View {
        
        HStack
        {
            WebImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png"))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(height: 150)
            WebImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/132.png"))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(height: 10)
        }
    }
}

#Preview {
    imageExample()
}
