//
//  ViewsModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 04-03-24.
//

import Swinject

final class ViewsModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }
    
    func inject() {
        injectPresentation()
    }
}

private extension ViewsModule {
    func injectPresentation() {
        container.register(ViewsViewModel.self) { resolver in
            ViewsViewModel()
        }
        container.register(ViewsCoordinator.self) { resolver in
            ViewsCoordinator(container: self.container)
        }
        container.register(ViewsViewController.self) { resolver in
            ViewsViewController(
                resolver.resolve(ViewsViewModel.self)!,
                resolver.resolve(ViewsCoordinator.self)!,
                resolver.resolve(NotificationCenterWrapper.self)!
            )
        }
    }
}
