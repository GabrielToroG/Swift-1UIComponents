//
//  LabelsModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 10-05-23.
//

import Foundation
import Swinject

class LabelsModule {
    static func register(container: Container) {
        container.register(LabelsViewModel.self) { _ in
            LabelsViewModel()
        }
        
        container.register(LabelsViewController.self) { resolver in
            let coordinator = resolver.resolve(Coordinator.self)!
            let notification = resolver.resolve(NotificationCenterWrapper.self)!
            let viewModel = resolver.resolve(LabelsViewModel.self)!
            return LabelsViewController(viewModel, coordinator: coordinator, notificationCenter: notification)
        }
    }
}
