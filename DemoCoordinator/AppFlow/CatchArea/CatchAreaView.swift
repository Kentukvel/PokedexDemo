//
//  CatchAreaView.swift
//  DemoCoordinator
//
//  Created by Dmitro Levkutnyk on 14.10.2024.
//

import SwiftUI
import Charts

struct ToyShape: Identifiable {
    var color: String
    var type: String
    var count: Double
    var id = UUID()
}

struct CatchAreaView: View {
    
    @StateObject var catchAreaViewModel: CatchAreaViewModel
    
    var stackedBarData: [ToyShape] = [
        .init(color: "Green", type: "Cube", count: 2),
        .init(color: "Green", type: "Sphere", count: 0),
        .init(color: "Green", type: "Pyramid", count: 1),
        .init(color: "Purple", type: "Cube", count: 1),
        .init(color: "Purple", type: "Sphere", count: 1),
        .init(color: "Purple", type: "Pyramid", count: 1),
        .init(color: "Pink", type: "Cube", count: 1),
        .init(color: "Pink", type: "Sphere", count: 2),
        .init(color: "Pink", type: "Pyramid", count: 0),
        .init(color: "Yellow", type: "Cube", count: 1),
        .init(color: "Yellow", type: "Sphere", count: 1),
        .init(color: "Yellow", type: "Pyramid", count: 2)
    ]
    
    var body: some View {
        if let selectedPokemon = catchAreaViewModel.selectedPokemon {
            VStack {
                Text(selectedPokemon.name)
                    .font(.title)
                Chart {
                    
                    BarMark(
                        x: .value("Stat", "Intelligence"),
                        y: .value("Value", selectedPokemon.pokemonProperties.intellegens)
                    )
                    .foregroundStyle(by: .value("Stat", "Green"))
                    .annotation(position: .top) {
                        Text("\(selectedPokemon.pokemonProperties.intellegens)")
                            .font(.caption)
                            .foregroundColor(.black)
                    }
                    
                    BarMark(
                        x: .value("Stat", "Strength"),
                        y: .value("Value", selectedPokemon.pokemonProperties.strength)
                    )
                    .foregroundStyle(by: .value("Stat", "Purple"))
                    .annotation(position: .top) {
                        Text("\(selectedPokemon.pokemonProperties.strength)")
                            .font(.caption)
                            .foregroundColor(.black)
                    }
                    
                    BarMark(
                        x: .value("Stat", "Defence"),
                        y: .value("Value", selectedPokemon.pokemonProperties.defense)
                    )
                    .foregroundStyle(by: .value("Stat", "Pink"))
                    .annotation(position: .top) {
                        Text("\(selectedPokemon.pokemonProperties.defense)")
                            .font(.caption)
                            .foregroundColor(.black)
                    }
                    
                    BarMark(
                        x: .value("Stat", "Speed"),
                        y: .value("Value", selectedPokemon.pokemonProperties.speed)
                    )
                    .foregroundStyle(by: .value("Stat", "Yellow"))
                    .annotation(position: .top) {
                        Text("\(selectedPokemon.pokemonProperties.speed)")
                            .font(.caption)
                            .foregroundColor(.black)
                    }
                    
                    BarMark(
                        x: .value("Stat", "Special Attack"),
                        y: .value("Value", selectedPokemon.pokemonProperties.specialAttack)
                    )
                    .foregroundStyle(by: .value("Stat", "Blue"))
                    .annotation(position: .top) {
                        Text("\(selectedPokemon.pokemonProperties.specialAttack)")
                            .font(.caption)
                            .foregroundColor(.black)
                    }
                }
                .chartForegroundStyleScale([
                    "Green": .green, "Purple": .purple, "Pink": .pink, "Yellow": .yellow, "Blue": .blue
                ])
                .padding()
                .padding(.bottom, 100)
            }
            Button("Change Pokemon", role: .cancel) {
                self.catchAreaViewModel.changePokemon()
            }
        }
        
    }
}

#Preview {
    CatchAreaView(catchAreaViewModel: CatchAreaViewModel())
}
