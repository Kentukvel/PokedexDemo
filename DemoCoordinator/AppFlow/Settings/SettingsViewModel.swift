//
//  SettingsViewModel.swift
//  DemoCoordinator
//
//  Created by Dmitro Levkutnyk on 14.10.2024.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    func openGoogle() {
           if let url = URL(string: "https://www.google.com") {
               UIApplication.shared.open(url)
           }
       }
}
