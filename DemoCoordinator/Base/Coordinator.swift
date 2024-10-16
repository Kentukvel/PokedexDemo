//
//  Coordinator.swift
//  DemoCoordinator
//
//  Created by Dmitro Levkutnyk on 10.10.2024.
//

import UIKit

protocol CoordinatorFinishDelegate : AnyObject {
  func coordinatorDidFinish(childCoordinator: Coordinator)
}

extension Coordinator {

  func addDependency(coordinator: Coordinator) {
    guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
    childCoordinators.append(coordinator)
  }

  func removeDependency(coordinator: Coordinator) {
    childCoordinators = childCoordinators.filter({$0 !== coordinator})
  }
}

protocol Coordinator: AnyObject {
  var childCoordinators: [Coordinator] { get set }
  var navigationController : UINavigationController { get }
  func start()
  func finish()
}

extension Coordinator {
  var typeName: String {
    return String(describing: type(of: self))
  }
  
  static var typeName: String {
    return String(describing: self)
  }
  
  func present(controller: UIViewController, animated: Bool = true) {
    navigationController.present(controller, animated: animated, completion: nil)
  }
  
  func push(controller: UIViewController, animated: Bool = true, isNavBarHidden: Bool = false, isTabBarHidden: Bool = false) {
    navigationController.pushViewController(controller, animated: animated)
    controller.navigationController?.isNavigationBarHidden = isNavBarHidden
  }
  
  func pop(animated: Bool = true) {
    navigationController.popViewController(animated: animated)
  }
  
  func set(controller: UIViewController, isTabBarHidden: Bool = false) {
    controller.hidesBottomBarWhenPushed = isTabBarHidden
    navigationController.setViewControllers([controller], animated: false)
  }
  
  func dismissController(animated: Bool = true) {
    navigationController.dismiss(animated: animated, completion: nil)
  }
  
}
