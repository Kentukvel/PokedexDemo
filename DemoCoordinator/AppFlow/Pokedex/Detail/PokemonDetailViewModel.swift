//
//  DetailHomeViewModel.swift
//  DemoCoordinator
//
//  Created by Dmitro Levkutnyk on 13.10.2024.
//

import Combine
import SwiftUI

class PokemonDetailViewModel: ObservableObject {
    var pokemonData: PokemonData
    init(pokemonData: PokemonData) {
        self.pokemonData = pokemonData
    }
}
