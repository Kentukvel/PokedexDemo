//
//  HomeViewModel.swift
//  DemoCoordinator
//
//  Created by Dmitro Levkutnyk on 13.10.2024.
//

import Combine
import SwiftUI


class PokedexViewModel: ObservableObject {
    
    //MARK: - Data
    let allPokemons = PokedexData()
    
    @Published var enabledPokemonsList: [PokemonData] = PokedexData().allPokemonsData
    
    //MARK: - Logic
//    func addPokemon() {
//        enabledPokemonsList.append(PokemonData(name: "asdsd", description: "asds", element: .electric, image: ""))
//    }
   
    //MARK: - Navigation
    let navigationSubject = PassthroughSubject<PokedexDestination, Never>()
    
    func goTo(_ destination: PokedexDestination) {
        navigationSubject.send(destination)
    }
    
    
}
