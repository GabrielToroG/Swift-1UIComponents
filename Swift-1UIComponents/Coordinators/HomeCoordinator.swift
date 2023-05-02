//
//  HomeCoordinator.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import UIKit
import Swinject

class HomeCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    private let container: Container
    weak var parentCoordinator: CoordinatorProtocol?

    init(navigationController: UINavigationController, container: Container) {
        self.navigationController = navigationController
        self.container = container
    }
    
    func didDeinit(_ coordinator: CoordinatorProtocol) {
        
    }
    
    func start() {
        let homeViewController = Injection.shared.controllerProvider.getHome()
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    func reset() {
        
    }
}
