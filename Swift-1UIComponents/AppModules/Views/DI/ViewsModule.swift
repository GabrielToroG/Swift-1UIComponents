//
//  ViewsModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 06-06-23.
//

import Swinject

class ViewsModule {
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
        container.register(ViewsViewModel.self) { _ in
            ViewsViewModel()
        }
        
        container.register(ViewsViewController.self) { resolver in
            let coordinator = resolver.resolve(Coordinator.self)!
            let notification = resolver.resolve(NotificationCenterWrapper.self)!
            let viewModel = resolver.resolve(ViewsViewModel.self)!
            return ViewsViewController(viewModel, coordinator: coordinator, notificationCenter: notification)
        }
    }
}
