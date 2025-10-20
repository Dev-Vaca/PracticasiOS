//
//  ListExample.swift
//  CursoIOS
//
//  Created by Julio César Vaca García on 01/10/25.
//

import SwiftUI

struct ListExample: View {
    var body: some View {
        VStack {
            List {
                ForEach(pokemons, id:\.name) {
                    pokemon in Text(pokemon.name)
                }
            }
            
            List(digimons) { digimon in Text(digimon.name) }
            
            List {
                    Section(header: Text("Pokemones")) {
                            ForEach(pokemons, id:\.name) {
                                pokemon in Text(pokemon.name)
                            }
                        
                    }
                    Section(header: Text("Digimones")) {
                        ForEach(digimons) { digimon in Text(digimon.name) }
                    }
            }.listStyle(.sidebar)
        }
    }
}

var pokemons = [
    Pokemon(name: "Pikachu"),
    Pokemon(name: "Charizard"),
    Pokemon(name: "Squirtle"),
    Pokemon(name: "Bulbasaur"),
]

var digimons = [
    Digimon(name: "Pablomon"),
    Digimon(name: "Cacamon"),
    Digimon(name: "Wendymon"),
    Digimon(name: "Tadeomon"),
]

struct Pokemon {
    let name: String
}

struct Digimon: Identifiable {
    var id = UUID()
    let name: String
}

#Preview {
    ListExample()
}
