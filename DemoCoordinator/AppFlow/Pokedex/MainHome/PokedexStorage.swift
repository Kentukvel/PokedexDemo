//
//  PokedexStorage.swift
//  DemoCoordinator
//
//  Created by Dmitro Levkutnyk on 13.10.2024.
//

import SwiftUI

enum PokemonElement {
    case electric
    case fire
    case water
    case grass
    case stone
    case psychic
}

struct PokemonData: Identifiable, Hashable {
    static func == (lhs: PokemonData, rhs: PokemonData) -> Bool {
        return lhs.name == rhs.name
    }
    
    let id = UUID()
    let name: String
    let description: String
    let element: PokemonElement
    let image: String
    
    var pokemonProperties: PokemonProperties
}

struct PokemonProperties: Hashable {
    var intellegens: Int
    var strength: Int
    var speed: Int
    var defense: Int
    var specialAttack: Int
}

struct PokedexData {
    let allPokemonsData: [PokemonData] = [PokemonData(name: "Bulbasaur", description: "A Grass/Poison-type Pokémon with a plant bulb on its back, which grows into a flower as it evolves.", element: .grass, image: "Bulbasaur", pokemonProperties: PokemonProperties(intellegens: 2, strength: 3, speed: 2, defense: 3, specialAttack: 3)),
                                          PokemonData(name: "Ivysaur", description: "The evolved form of Bulbasaur, Ivysaur's bulb blooms into a bud, and it becomes stronger and more agile.", element: .grass, image: "Ivysaur", pokemonProperties: PokemonProperties(intellegens: 3, strength: 4, speed: 3, defense: 3, specialAttack: 3)),
                                          PokemonData(name: "Venusaur", description: "The final form of Bulbasaur, Venusaur has a large flower on its back that blooms when it absorbs enough sunlight.", element: .grass, image: "Venusaur", pokemonProperties: PokemonProperties(intellegens: 4, strength: 5, speed: 3, defense: 5, specialAttack: 4)),
                                          PokemonData(name: "Charmander", description: "A Fire-type lizard Pokémon, Charmander has a flame on its tail that burns brighter as it grows stronger.", element: .fire, image: "Charmander", pokemonProperties: PokemonProperties(intellegens: 2, strength: 3, speed: 2, defense: 3, specialAttack: 3)),
                                          PokemonData(name: "Charmeleon", description: "Charmander evolves into Charmeleon, gaining more aggressive traits and a hotter flame on its tail.", element: .fire, image: "Charmeleon", pokemonProperties: PokemonProperties(intellegens: 3, strength: 4, speed: 3, defense: 3, specialAttack: 3)),
                                          PokemonData(name: "Charizard", description: "The final form of Charmander, Charizard is a powerful Fire/Flying-type Pokémon capable of flying and breathing fire.", element: .fire, image: "Charizard", pokemonProperties: PokemonProperties(intellegens: 4, strength: 5, speed: 3, defense: 5, specialAttack: 4)),
                                          PokemonData(name: "Squirtle", description: "A Water-type turtle Pokémon, Squirtle shoots water from its mouth to defend itself and escape from danger.", element: .water, image: "Squirtle", pokemonProperties: PokemonProperties(intellegens: 2, strength: 3, speed: 2, defense: 3, specialAttack: 3)),
                                          PokemonData(name: "Wartortle", description: "Squirtle evolves into Wartortle, a larger turtle with fur on its tail and ears, indicating its age and wisdom.", element: .water, image: "Wartortle", pokemonProperties: PokemonProperties(intellegens: 3, strength: 4, speed: 3, defense: 3, specialAttack: 3)),
                                          PokemonData(name: "Blastoise", description: "The final form of Squirtle, Blastoise is equipped with powerful water cannons on its back, used for both defense and offense.", element: .water, image: "Blastoise", pokemonProperties: PokemonProperties(intellegens: 4, strength: 5, speed: 3, defense: 5, specialAttack: 4)),
                                          PokemonData(name: "Pikachu", description: "An Electric-type Pokémon and the mascot of the Pokémon franchise, Pikachu stores electricity in its cheeks, releasing powerful electric shocks when threatened. Known for its agility and strong bond with trainers, it evolves from Pichu and can evolve into Raichu.", element: .electric, image: "Pikachu", pokemonProperties: PokemonProperties(intellegens: 4, strength: 3, speed: 5, defense: 2, specialAttack: 5)),
                                          PokemonData(name: "Mewtwo", description: "A Psychic-type Legendary Pokémon, Mewtwo was genetically engineered from the DNA of Mew, making it one of the most powerful and intelligent Pokémon. With incredible psychic abilities and a cold demeanor, it is known for its conflicted nature, seeking meaning in its existence.", element: .psychic, image: "Mewtwo", pokemonProperties: PokemonProperties(intellegens: 5, strength: 5, speed: 5, defense: 5, specialAttack: 5)),
                                          PokemonData(name: "Entei", description: "A Fire-type Legendary Pokémon, Entei is one of the three Legendary Beasts, said to have been resurrected by Ho-Oh. It is known for its immense power, capable of creating volcanoes with a roar. Entei is a symbol of fire and destruction, fiercely protective and proud.", element: .fire, image: "Entei", pokemonProperties: PokemonProperties(intellegens: 4, strength: 5, speed: 5, defense: 4, specialAttack: 5)),
                                          PokemonData(name: "Celebi", description: "A Grass/Psychic-type Mythical Pokémon, Celebi is known as the guardian of the forest and has the ability to travel through time. It is a peaceful and mysterious Pokémon, often appearing during times of harmony and growth, and is said to protect nature and forests.", element: .grass, image: "Celebi", pokemonProperties: PokemonProperties(intellegens: 3, strength: 3, speed: 5, defense: 2, specialAttack: 5)),
                                          PokemonData(name: "Jirachi", description: "A Steel/Psychic-type Mythical Pokémon, Jirachi is said to awaken for only seven days once every thousand years. During this time, it has the power to grant any wish written on the tags that hang from its head. Known as the \"Wish Maker,\" Jirachi is a peaceful and gentle Pokémon, often associated with hope and dreams. When asleep, it shields itself with a tough, crystalline cocoon.", element: .psychic, image: "Jirachi", pokemonProperties: PokemonProperties(intellegens: 2, strength: 2, speed: 2, defense: 2, specialAttack: 5))]
}
