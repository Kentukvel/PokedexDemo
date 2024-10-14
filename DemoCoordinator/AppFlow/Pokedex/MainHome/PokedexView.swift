//
//  HomeView.swift
//  DemoCoordinator
//
//  Created by Dmitro Levkutnyk on 13.10.2024.
//

import SwiftUI

struct PokedexView: View {
    @StateObject var viewModel: PokedexViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.enabledPokemonsList, id: \.self) { item in
                    VStack(alignment: .leading) {
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                            .padding()
                        
                        Text(item.name)
                            .font(.headline)
                        
                        Text(item.description)
                            .font(.subheadline)
                            .lineLimit(2)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .onTapGesture {
                        print("Tapped on \(item.name)")
                        self.viewModel.goTo(.detail(pokemon: item))
                    }
                }
            }
            .padding()
            .padding(.bottom, 200)
        }
        .navigationTitle("Pokedex")
    }
}

#Preview {
    PokedexView(viewModel: PokedexViewModel())
}
