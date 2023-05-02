//
//  HomeModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import Foundation
import Swinject

class HomeModule {
    static func register(container: Container) {
        container.register(HomeViewModel.self) { _ in
            HomeViewModel()
        }
        
        container.register(HomeViewController.self) { resolver in
            let coordinator = resolver.resolve(Coordinator.self)!
            let notification = resolver.resolve(NotificationCenterWrapper.self)!
            let viewModel = resolver.resolve(HomeViewModel.self)!
            return HomeViewController(viewModel, coordinator: coordinator, notificationCenter: notification)
        }
    }
}
