//
//  SettingsCoordinator.swift
//  DemoCoordinator
//
//  Created by Dmitro Levkutnyk on 14.10.2024.
//

import UIKit
import SwiftUI
import Combine

class SettingsCoordinator: Coordinator  {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var cancellables = Set<AnyCancellable>()
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let settingsView = SettingsView()
        let hostingController = UIHostingController(rootView: settingsView)
        
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    func finish() {
      print("Finish")
    }
}

