//
//  InitCoordinator.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 18-02-24.
//

import UIKit
import Swinject

class InitCoordinator: CoordinatorProtocol {
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
