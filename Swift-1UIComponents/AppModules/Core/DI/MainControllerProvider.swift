//
//  MainControllerProvider.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 18-02-24.
//

import Foundation
import Swinject

final class MainControllerProvider {
    private let container: Container

    init(_ container: Container) {
        self.container = container
    }

    func inject(initCoordinator: InitCoordinator?) {
        container.register(InitCoordinator?.self) { _ in
            initCoordinator
        }
    }
    func getHome() -> UIViewController {
        container.resolve(HomeViewController.self)!
    }
}
