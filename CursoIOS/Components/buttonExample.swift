//
//  buttonExample.swift
//  CursoIOS
//
//  Created by Julio César Vaca García on 26/09/25.
//

import SwiftUI

struct buttonExample: View {
    var body: some View {
        
        var numero: Int = 0;
        
        Button("Incrementar") {
            numero += 1
            print(numero)
        }
        Button(action: {
            print("Pablito")
        }, label: {
            Text("Imprimir")
                .font(.system(size: 25))
                .frame(width: 150, height: 50)
                .foregroundColor(.white)
                .background(.indigo)
                .cornerRadius(10)
        })
    }
}

struct Counter: View {
    @State var number = 0
    @State var bool = false
    var body: some View {
        Button(action: {
            number += 1
            if(number == 50) {
                bool = true
            }
        }, label: {
            Text("Numero = \(number)")
                .font(.system(size: 25, weight: .bold))
                .frame(width: 300, height: 50)
                .foregroundColor(.white)
                .background(.red)
                .cornerRadius(10)
        })
        
        if(bool == true) {
            Text("Hola")
                .font(.system(size: 25, weight: .bold))
                .frame(width: 300, height: 50)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
            Button(action: {
                number = 0
                bool = false
            }, label: {
                Text("Reset")
                    .font(.system(size: 25, weight: .bold))
                    .frame(width: 300, height: 50)
                    .foregroundColor(.white)
                    .background(.green)
                    .cornerRadius(10)
            })
        }
    }
}

#Preview {
    Counter()
}
