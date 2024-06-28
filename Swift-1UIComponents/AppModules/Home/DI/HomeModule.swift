//
//  HomeModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-02-24.
//

import Foundation
import Swinject

final class HomeModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        injectPresentation()
    }
}

private extension HomeModule {
    func injectPresentation() {
        container.register(HomeViewModel.self) { _ in
            HomeViewModel()
        }
        container.register(HomeCoordinator.self) { _ in
            HomeCoordinator(container: self.container)
        }
        container.register(HomeViewController.self) { resolver in
            HomeViewController(
                resolver.resolve(HomeViewModel.self)!,
                resolver.resolve(HomeCoordinator.self)!,
                resolver.resolve(NotificationCenterWrapper.self)!
            )
        }
    }
}
