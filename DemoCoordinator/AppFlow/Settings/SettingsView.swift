//
//  SettingsView.swift
//  DemoCoordinator
//
//  Created by Dmitro Levkutnyk on 14.10.2024.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var settingsViewModel: SettingsViewModel
    
    var body: some View {
        VStack {
            Button("Privacy Policy") {

            }
            Spacer()
         }
        .padding(.top, 50)
    }
}

#Preview {
    SettingsView(settingsViewModel: SettingsViewModel())
}
