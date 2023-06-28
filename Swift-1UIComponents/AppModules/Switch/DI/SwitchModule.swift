//
//  SwitchModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 28-05-23.
//

import Swinject

class SwitchModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        injectPresentation()
    }
}

extension SwitchModule {
    func injectPresentation() {
        container.register(SwitchViewModel.self) { _ in
            SwitchViewModel()
        }
        
        container.register(SwitchViewController.self) { resolver in
            let coordinator = resolver.resolve(Coordinator.self)!
            let notification = resolver.resolve(NotificationCenterWrapper.self)!
            let viewModel = resolver.resolve(SwitchViewModel.self)!
            return SwitchViewController(viewModel, coordinator: coordinator, notificationCenter: notification)
        }
    }
}
