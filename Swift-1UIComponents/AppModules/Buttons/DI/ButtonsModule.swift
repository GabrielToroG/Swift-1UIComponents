//
//  ButtonsModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 05-03-24.
//

import Foundation
import Swinject

final class ButtonsModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }
    
    func inject() {
        injectPresentation()
    }
}

private extension ButtonsModule {
    func injectPresentation() {
        container.register(ButtonsViewModel.self) { resolver in
            ButtonsViewModel()
        }
        container.register(ButtonsCoordinator.self) { resolver in
            ButtonsCoordinator(container: self.container)
        }
        container.register(ButtonsViewController.self) { resolver in
            ButtonsViewController(
                resolver.resolve(ButtonsViewModel.self)!,
                resolver.resolve(ButtonsCoordinator.self)!,
                resolver.resolve(NotificationCenterWrapper.self)!
            )
        }
    }
}
