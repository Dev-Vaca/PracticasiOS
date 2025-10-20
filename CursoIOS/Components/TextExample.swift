//
//  TextExample.swift
//  CursoIOS
//
//  Created by Julio César Vaca García on 25/09/25.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack{
            Text("Hola").font(.headline)
            Text("Custom")
                .font(.system(size: 40, weight: .light, design: .monospaced))
                .italic()
                .underline()
                .foregroundColor(.red)
            Text("VACA VACA VACA VACA")
                .frame(width: 150)
                .lineLimit(3)
                .lineSpacing(10)
        }
    }
}

#Preview {
    TextExample()
}
