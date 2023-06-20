//
//  TablesViewModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-06-23.
//

import Foundation

import Swinject

class TablesViewModule {
    static func register(_ container: Container) {
        container.register(TablesViewViewModel.self) { _ in
            TablesViewViewModel()
        }
        
        container.register(TablesViewViewController.self) { resolver in
            let coordinator = resolver.resolve(Coordinator.self)!
            let notification = resolver.resolve(NotificationCenterWrapper.self)!
            let viewModel = resolver.resolve(TablesViewViewModel.self)!
            return TablesViewViewController(viewModel, coordinator: coordinator, notificationCenter: notification)
        }
    }
}
