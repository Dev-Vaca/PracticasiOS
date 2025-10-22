//
//  SuperheroSearcher.swift
//  CursoIOS
//
//  Created by Julio César Vaca García on 01/10/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperheroSearcher: View {
    
    @State var superheroName: String = ""
    @State var wrapper: ApiNetwork.Wrapper? = nil
    @State var loading: Bool = false
    
    var body: some View {
        VStack {
            TextField("", text: $superheroName,prompt: Text("Superman...").foregroundColor(.gray).bold().font(.title2)
                )
                .bold()
                .font((.title2))
                .foregroundColor(.white)
                .padding(16)
                .border(Color.purple, width: 2)
                .padding(8)
                .autocorrectionDisabled()
                .onSubmit {
                    loading = true
                    Task {
                        do {
                            wrapper = try await ApiNetwork().getHeroesByQuery(query: superheroName)
                        } catch {
                            print("Error")
                        }
                        loading = false
                    }
                }
            
            if loading {
                ProgressView().tint(.white)
            }
            
            NavigationStack {
                List(wrapper?.results ?? []) { superhero in
                    ZStack {
                        NavigationLink(destination: SuperheroDetail(id: superhero.id)) {EmptyView()}.opacity(0)
                        SuperheroItem(superhero: superhero)
                    }.listRowBackground(Color.backgroundIMC)
                }.listStyle(.plain).background(Color.backgroundIMC)
            }
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundIMC)
    }
}

struct SuperheroItem: View {
    let superhero: ApiNetwork.Superhero
    
    var body: some View {
        ZStack {
            WebImage(url: URL(string: superhero.image.url))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(height: 200)
            
            VStack {
                Spacer()
                Text(superhero.name)
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.5))
            }
        }
        .frame(height: 200)
        .cornerRadius(32)
    }
}

#Preview {
    SuperheroSearcher()
}
