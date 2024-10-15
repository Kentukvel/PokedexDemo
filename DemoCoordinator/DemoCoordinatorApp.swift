//
//  DemoCoordinatorApp.swift
//  DemoCoordinator
//
//  Created by Dmitro Levkutnyk on 10.10.2024.
//

import SwiftUI

@main
struct DemoCoordinatorApp: App {

    var body: some Scene {
        WindowGroup {
            ApplicationCoordinatorRepresentable()
        }
    }
}
