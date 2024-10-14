//
//  CatchAreaCoordinator.swift
//  DemoCoordinator
//
//  Created by Dmitro Levkutnyk on 14.10.2024.
//

import UIKit
import SwiftUI
import Combine

class CatchAreaCoordinator: Coordinator  {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var cancellables = Set<AnyCancellable>()
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let catchAreaView = CatchAreaView()
        let hostingController = UIHostingController(rootView: catchAreaView)
        
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    func finish() {
      print("Finish")
    }
}
