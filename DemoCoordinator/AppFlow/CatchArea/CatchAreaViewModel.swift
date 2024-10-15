//
//  CatchAreaViewModel.swift
//  DemoCoordinator
//
//  Created by Dmitro Levkutnyk on 15.10.2024.
//

import SwiftUI

class CatchAreaViewModel: ObservableObject {
    var allPokemons: PokedexData!
    
    init(selectedPokemon: PokemonData? = nil) {
        self.allPokemons = PokedexData()
        self.selectedPokemon = allPokemons.allPokemonsData.first
    }
    @Published var selectedPokemon: PokemonData?
    func changePokemon() {
        selectedPokemon = allPokemons.allPokemonsData.randomElement()
    }
}
