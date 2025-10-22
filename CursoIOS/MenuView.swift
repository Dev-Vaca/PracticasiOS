//
//  MenuView.swift
//  CursoIOS
//
//  Created by Julio César Vaca García on 29/09/25.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: LoginFake()) {
                    HStack(spacing: 16) {
                        Image(systemName: "lock")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.indigo)
                        
                        Text("LoginFake")
                            .font(.system(size: 17, weight: .regular))
                    }
                    .padding(.vertical, 8)
                }
                
                NavigationLink(destination: Exercise1()) {
                    HStack(spacing: 16) {
                        Image(systemName: "paintpalette.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.pink)
                        
                        Text("Pintura")
                            .font(.system(size: 17, weight: .regular))
                    }
                    .padding(.vertical, 8)
                }
                
                NavigationLink(destination: IMCView()) {
                    HStack(spacing: 16) {
                        Image(systemName: "stethoscope")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.blue)
                        
                        Text("Calculadora IMC")
                            .font(.system(size: 17, weight: .regular))
                    }
                    .padding(.vertical, 8)
                }
                
                NavigationLink(destination: SuperheroSearcher()) {
                    HStack(spacing: 16) {
                        Image(systemName: "figure.fencing")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.green)
                        
                        Text("Superheroes")
                            .font(.system(size: 17, weight: .regular))
                    }
                    .padding(.vertical, 8)
                }
                
                NavigationLink(destination: FavPlaces()) {
                    HStack(spacing: 16) {
                        Image(systemName: "map.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.green)
                        
                        Text("Mapa")
                            .font(.system(size: 17, weight: .regular))
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Menú")
            .navigationBarTitleDisplayMode(.large)
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    MenuView()
}
