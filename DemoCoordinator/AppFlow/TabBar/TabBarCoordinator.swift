//
//  TabBarCoordinator.swift
//  DemoCoordinator
//
//  Created by Dmitro Levkutnyk on 12.10.2024.
//

import UIKit
import SwiftUI

struct CustomTabSetup {
    
    var coordinator: Coordinator
    var image: UIImage
    var title: String
    var id: Int
    var onClick: (() -> ())
}

class TabBarCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var tabBarViewController: TabBarController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    func start() {
        startTabBarViewController()
    }
    
    func startTabBarViewController() {
        let tabs = [createHomeTab(index: 0),
                    createCatchAreaTab(index: 1),
                    createSettingsTab(index: 2)]
        
        self.tabBarViewController = TabBarController(barsSetup: tabs)
        
        let viewControllers = tabs.map({ $0.coordinator.navigationController })
        self.tabBarViewController!.viewControllers = viewControllers
        
        set(controller: self.tabBarViewController!)
    }
    
    func createHomeTab(index: Int) -> CustomTabSetup {
        let notesCoordinator = PokedexCoordinator(navigationController: BaseNavigationController())
        notesCoordinator.start()
        self.childCoordinators.append(notesCoordinator)
        return CustomTabSetup(coordinator: notesCoordinator,
                              image: UIImage(systemName: "list.clipboard") ?? UIImage(),
                              title: "Pokedex",
                              id: index) { [weak self] in
            guard let self = self else { return }
            self.tabBarViewController?.selectedIndex = index
        }
    }
    
    func createCatchAreaTab(index: Int) -> CustomTabSetup {
        let catchAreaCoordinator = CatchAreaCoordinator(navigationController: BaseNavigationController())
        catchAreaCoordinator.start()
        self.childCoordinators.append(catchAreaCoordinator)
        return CustomTabSetup(coordinator: catchAreaCoordinator,
                              image: UIImage(systemName: "lasso.badge.sparkles") ?? UIImage(),
                              title: "Catch Area",
                              id: index) { [weak self] in
            guard let self = self else { return }
            self.tabBarViewController?.selectedIndex = index
        }
    }
    
    func createSettingsTab(index: Int) -> CustomTabSetup {
        let settingsCoordinator = SettingsCoordinator(navigationController: BaseNavigationController())
        settingsCoordinator.start()
        self.childCoordinators.append(settingsCoordinator)
        return CustomTabSetup(coordinator: settingsCoordinator,
                              image: UIImage(systemName: "gear") ?? UIImage(),
                              title: "Settings",
                              id: index) { [weak self] in
            guard let self = self else { return }
            self.tabBarViewController?.selectedIndex = index
        }
    }
    
    func finish() {
        for coordinator in childCoordinators {
            coordinator.finish()
        }
    }
    
}

