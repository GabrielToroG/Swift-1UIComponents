//
//  TextFieldsModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 25-03-24.
//

import Swinject

final class TextFieldsModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }
    
    func inject() {
        injectPresentation()
    }
}

private extension TextFieldsModule {
    func injectPresentation() {
        container.register(TextFieldsViewModel.self) { resolver in
            TextFieldsViewModel()
        }
        container.register(TextFieldsCoordinator.self) { resolver in
            TextFieldsCoordinator(container: self.container)
        }
        container.register(TextFieldsViewController.self) { resolver in
            TextFieldsViewController(
                resolver.resolve(TextFieldsViewModel.self)!,
                resolver.resolve(TextFieldsCoordinator.self)!,
                resolver.resolve(NotificationCenterWrapper.self)!
            )
        }

        container.register(LabeledTextFieldViewModel.self) { resolver in
            LabeledTextFieldViewModel()
        }
        container.register(LabeledTextFieldViewController.self) { resolver in
            LabeledTextFieldViewController(
                resolver.resolve(LabeledTextFieldViewModel.self)!,
                resolver.resolve(TextFieldsCoordinator.self)!,
                resolver.resolve(NotificationCenterWrapper.self)!
            )
        }
    }
}
