//
//  SwitchModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 23-07-24.
//

import Foundation

import Swinject

final class SwitchModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }
    
    func inject() {
        injectPresentation()
    }
}

private extension SwitchModule {
    func injectPresentation() {
        container.register(SwitchViewModel.self) { resolver in
            SwitchViewModel()
        }
        container.register(SwitchCoordinator.self) { resolver in
            SwitchCoordinator(container: self.container)
        }
        container.register(SwitchViewController.self) { resolver in
            SwitchViewController(
                resolver.resolve(SwitchViewModel.self)!,
                resolver.resolve(SwitchCoordinator.self)!,
                resolver.resolve(NotificationCenterWrapper.self)!
            )
        }
    }
}
