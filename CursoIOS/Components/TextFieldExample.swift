//
//  TextFieldExample.swift
//  CursoIOS
//
//  Created by Julio César Vaca García on 26/09/25.
//

import SwiftUI

struct TextFieldExample: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            TextField("Escribe tu email", text: $email)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.4))
                .cornerRadius(16)
                .padding(.horizontal, 32)
                .onChange(of: email) { oldValue, newValue in print("El antiguo valor era \(oldValue) y ahora es \(newValue)")
                }
            SecureField("Escribe tu contraseña", text: $password)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.4))
                .cornerRadius(16)
                .padding(.horizontal, 32)
                .onChange(of: password) { oldValue, newValue in print("El antiguo valor era \(oldValue) y ahora es \(newValue)")
                }
        }
    }
}

#Preview {
    TextFieldExample()
}
