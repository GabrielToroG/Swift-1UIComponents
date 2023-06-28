//
//  LabelsModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 10-05-23.
//

import Foundation
import Swinject

final class LabelsModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        injectPresentation()
    }
}

private extension LabelsModule {
    func injectPresentation() {
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
