//
//  ButtonsModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 12-05-23.
//

import Foundation
import Swinject

class ButtonsModule {
    static func register(_ container: Container) {
        container.register(ButtonsViewModel.self) { _ in
            ButtonsViewModel()
        }
        
        container.register(ButtonsViewController.self) { resolver in
            let coordinator = resolver.resolve(Coordinator.self)!
            let notification = resolver.resolve(NotificationCenterWrapper.self)!
            let viewModel = resolver.resolve(ButtonsViewModel.self)!
            return ButtonsViewController(viewModel, coordinator: coordinator, notificationCenter: notification)
        }
    }
}
