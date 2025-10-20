//
//  LoginFake.swift
//  CursoIOS
//
//  Created by Julio César Vaca García on 25/09/25.
//

import SwiftUI

struct LoginFake: View {
    @State var email = ""
    @State var password = ""
    @State var bool = false
    
    var body: some View {
        if(bool == false) {
            ZStack {
                Color.indigo
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Inicia Sesion")
                        .font(.system(size: 40, weight: .light))
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                    
                    TextField("Escribe tu email", text: $email)
                        .keyboardType(.emailAddress)
                        .foregroundColor(.black)
                        .tint(.black)
                        .padding(16)
                        .background(.white)
                        .cornerRadius(16)
                        .padding(.horizontal, 32)
                    
                    SecureField("Escribe tu contraseña", text: $password)
                        .keyboardType(.default)
                                .foregroundColor(.black)
                                .tint(.black)
                                .padding(16)
                                .background(Color.white)
                                .cornerRadius(16)
                                .padding(.horizontal, 32)

                    
                    Button(action: { bool = true }) {
                        Text("Iniciar Sesion")
                            .font(.system(size: 20, weight: .light))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.white)
                            .cornerRadius(16)
                    }
                    .padding(.horizontal, 32)
                    .padding(.top, 10)
                    
                    Text("No tienes una cuenta?")
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(.white)
                        .padding(.top, 5)
                }
            }
        } else {
            ZStack {
                Color.indigo
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Iniciaste")
                        .font(.system(size: 40, weight: .light))
                        .foregroundColor(.white)
                    
                    Button(action: { bool = false }) {
                        Text("Volver")
                            .font(.system(size: 20, weight: .light))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.white)
                            .cornerRadius(16)
                    }
                    .padding(.horizontal, 32)
                }
            }
        }
    }
}

#Preview {
    LoginFake()
}
