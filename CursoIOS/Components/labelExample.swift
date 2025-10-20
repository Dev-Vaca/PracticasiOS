//
//  labelExample.swift
//  CursoIOS
//
//  Created by Julio César Vaca García on 26/09/25.
//

import SwiftUI

struct labelExample: View {
    var body: some View {
        Label("Hola", image: "swiftui")
        Label("Jugar", systemImage: "xbox.logo")
        Label(title: { Text("Hola") }, icon: {Image("swiftui").resizable().scaledToFit().frame(height: 30)})
    }
}

#Preview {
    labelExample()
}
