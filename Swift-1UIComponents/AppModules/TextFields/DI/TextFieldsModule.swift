//
//  TextFieldsModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 12-05-23.
//

import Foundation
import Swinject

class TextFieldsModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        injectPresentation()
    }
}

extension TextFieldsModule {
    func injectPresentation() {
        container.register(TextFieldsViewModel.self) { _ in
            TextFieldsViewModel()
        }
        
        container.register(TextFieldsViewController.self) { resolver in
            let coordinator = resolver.resolve(Coordinator.self)!
            let notification = resolver.resolve(NotificationCenterWrapper.self)!
            let viewModel = resolver.resolve(TextFieldsViewModel.self)!
            return TextFieldsViewController(viewModel, coordinator: coordinator, notificationCenter: notification)
        }
    }
}
