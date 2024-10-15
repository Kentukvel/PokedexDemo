//
//  ApplicationCoordinator.swift
//  DemoCoordinator
//
//  Created by Dmitro Levkutnyk on 10.10.2024.
//

import UIKit
import SwiftUI

class ApplicationCoordinator: Coordinator  {
  
  weak var finishDelegate: CoordinatorFinishDelegate?
  var childCoordinators: [Coordinator] = []
  var navigationController: UINavigationController
  
  required init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
      startTabBar()
  }

  
  func startTabBar() {
    let tabBarCoordinator = TabBarCoordinator(navigationController: self.navigationController)
    tabBarCoordinator.start()
    addDependency(coordinator: tabBarCoordinator)
  }

  
  func startDEBUG(vc: UIViewController, isNavigationBarHidden: Bool) {
    push(controller: vc, isNavBarHidden: isNavigationBarHidden)
  }
  
  func finish() {
    print("Finish")
  }
  
}

struct ApplicationCoordinatorRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: false)

        let coordinator = ApplicationCoordinator(navigationController: navigationController)
        coordinator.start()
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
}
