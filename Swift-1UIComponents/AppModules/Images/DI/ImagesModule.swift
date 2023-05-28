//
//  ImagesModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-05-23.
//

import Swinject

class ImagesModule {
    static func register(_ container: Container) {
        container.register(ImagesViewModel.self) { _ in
            ImagesViewModel()
        }
        
        container.register(ImagesViewController.self) { resolver in
            let coordinator = resolver.resolve(Coordinator.self)!
            let notification = resolver.resolve(NotificationCenterWrapper.self)!
            let viewModel = resolver.resolve(ImagesViewModel.self)!
            return ImagesViewController(viewModel, coordinator: coordinator, notificationCenter: notification)
        }
    }
}
