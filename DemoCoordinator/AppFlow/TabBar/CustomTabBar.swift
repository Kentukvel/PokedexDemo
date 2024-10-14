//
//  CustomTabBar.swift
//  DemoCoordinator
//
//  Created by Dmitro Levkutnyk on 13.10.2024.
//

import SwiftUI

struct CustomTabBarView: View {
    var tabBarController: UITabBarController
    
    @State private var selectedIndex = 0
    @State var tabs: [CustomTabSetup] = []
    init(tabs: [CustomTabSetup], tabBarController: UITabBarController ) {
        self.tabs = tabs
        self.tabBarController = tabBarController
    }
    
    var body: some View {
        HStack(spacing: 20) {
            Spacer()
            ForEach(tabs, id: \.id) { tab in
                Button {
                    selectedIndex = tab.id
                    tabBarController.selectedIndex = tab.id
                } label: {
                    VStack {
                        Image(uiImage: tab.image)
                            .padding(.top, 0)
                        Text(tab.title)
                            .font(.system(size: 12, weight: .bold))
                            .padding(.top, 5)
                    }
//                    .padding()
                    .padding(.top, 0)
                    
                    .foregroundColor(selectedIndex == tab.id ? .blue : .gray)
                }
                if tab.id != tabs.count - 1 {
                    Spacer()
                }
            }
            Spacer()
        }
        .padding()
        .background(Color.white.shadow(.drop(radius: 10)))
        .frame(maxWidth: .infinity)
    }
}
