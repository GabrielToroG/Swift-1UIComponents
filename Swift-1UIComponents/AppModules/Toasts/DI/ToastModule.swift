//
//  ToastModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 04-06-23.
//

import Swinject

class ToastModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        injectPresentation()
    }
}

private extension ToastModule {
    func injectPresentation() {
        container.register(ToastViewModel.self) { _ in
            ToastViewModel()
        }
        
        container.register(ToastViewController.self) { resolver in
            let coordinator = resolver.resolve(Coordinator.self)!
            let notification = resolver.resolve(NotificationCenterWrapper.self)!
            let viewModel = resolver.resolve(ToastViewModel.self)!
            return ToastViewController(viewModel, coordinator: coordinator, notificationCenter: notification)
        }
    }
}
