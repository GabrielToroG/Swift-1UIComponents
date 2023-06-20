//
//  ViewsModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 06-06-23.
//

import Swinject

class ViewsModule {
    static func register(_ container: Container) {
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
