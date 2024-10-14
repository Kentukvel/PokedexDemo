//
//  TabBarController.swift
//  DemoCoordinator
//
//  Created by Dmitro Levkutnyk on 13.10.2024.
//

import UIKit
import SwiftUI

class TabBarController: UITabBarController {
    
    var customTabSetup: [CustomTabSetup]
    
    init(barsSetup: [CustomTabSetup]) {
        self.customTabSetup = barsSetup
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        
        //MARK: - Setup TabBar
        self.tabBar.isHidden = true
        
        let customTabBar = UIHostingController(rootView: CustomTabBarView(tabs: customTabSetup, tabBarController: self))
        addChild(customTabBar)
        customTabBar.view.backgroundColor = .clear
        customTabBar.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customTabBar.view)
        
        NSLayoutConstraint.activate([
            customTabBar.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customTabBar.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customTabBar.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            customTabBar.view.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        customTabBar.didMove(toParent: self)
        
        self.tabBar.isTranslucent = true
        self.tabBar.backgroundColor = .clear
        self.tabBar.isHidden = true
         
    }
}
