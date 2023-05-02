//
//  MainControllerProvider.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import Foundation
import Swinject

final class MainControllerProvider {
    private let container: Container

    init(_ container: Container) {
        self.container = container
    }

    func inject(homeCoordinator: HomeCoordinator?) {
        container.register(HomeCoordinator?.self) { _ in
            homeCoordinator
        }
    }
    func getHome() -> UIViewController {
        container.resolve(HomeViewController.self)!
    }
}
