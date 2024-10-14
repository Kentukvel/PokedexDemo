//
//  DetailHomeView.swift
//  DemoCoordinator
//
//  Created by Dmitro Levkutnyk on 13.10.2024.
//

import SwiftUI

struct PokemonDetalView: View {
    @StateObject var viewModel: PokemonDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                Image(viewModel.pokemonData.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    //.frame(width: 100, height: 100)
                    .padding(60)
                    .background(Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
                    .cornerRadius(10)
                Text(viewModel.pokemonData.description)
                    .font(.callout)
                    .padding(.top, 20)
            }
            .padding(.bottom, 200)
        }
        .navigationTitle(viewModel.pokemonData.name)
        .padding()
    }
}

