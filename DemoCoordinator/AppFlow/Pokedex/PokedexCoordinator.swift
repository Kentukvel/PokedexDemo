//
//  HomeCoordinator.swift
//  DemoCoordinator
//
//  Created by Dmitro Levkutnyk on 13.10.2024.
//

import UIKit
import SwiftUI
import Combine

enum PokedexDestination {
    case detail(pokemon: PokemonData)
}

class PokedexCoordinator: Coordinator  {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var cancellables = Set<AnyCancellable>()
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = PokedexViewModel()
               let homeView = PokedexView(viewModel: viewModel)
               let hostingController = UIHostingController(rootView: homeView)
               // Подписываемся на события навигации
               viewModel.navigationSubject
                   .sink { [weak self] destination in
                       self?.navigate(to: destination)
                   }
                   .store(in: &cancellables)
               
        navigationController.title = "Pokedex"
        navigationController.navigationBar.prefersLargeTitles = true
               navigationController.pushViewController(hostingController, animated: false)
       
           }
      
    func showDetail(withPokemon pokemonData: PokemonData) {
        let viewModel = PokemonDetailViewModel(pokemonData: pokemonData)
          let detailView = PokemonDetalView(viewModel: viewModel)
          let hostingController = UIHostingController(rootView: detailView)
          navigationController.pushViewController(hostingController, animated: true)
      }
    
    func navigate(to destination: PokedexDestination) {
        switch destination {
        case .detail(let pokemonData):
            self.showDetail(withPokemon: pokemonData)
        }
    }
    
    func finish() {
      print("Finish")
    }
}
