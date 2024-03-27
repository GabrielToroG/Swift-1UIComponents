//
//  ProgressBarModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-03-24.
//

import Swinject

final class ProgressBarModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }
    
    func inject() {
        injectPresentation()
    }
}

private extension ProgressBarModule {
    func injectPresentation() {
        container.register(ProgressBarViewModel.self) { resolver in
            ProgressBarViewModel()
        }
        container.register(ProgressBarCoordinator.self) { resolver in
            ProgressBarCoordinator(container: self.container)
        }
        container.register(ProgressBarViewController.self) { resolver in
            ProgressBarViewController(
                resolver.resolve(ProgressBarViewModel.self)!,
                resolver.resolve(ProgressBarCoordinator.self)!,
                resolver.resolve(NotificationCenterWrapper.self)!
            )
        }
    }
}
