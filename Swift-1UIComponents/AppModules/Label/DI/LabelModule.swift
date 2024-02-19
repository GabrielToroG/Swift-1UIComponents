//
//  LabelModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-02-24.
//

import Foundation
import Swinject

final class LabelModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        injectPresentation()
    }
}

private extension LabelModule {
    func injectPresentation() {
        container.register(LabelViewModel.self) { resolver in
            LabelViewModel()
        }

        container.register(LabelCoordinator.self) { _ in
            LabelCoordinator(container: self.container)
        }
        container.register(LabelViewController.self) { resolver in
            LabelViewController(
                resolver.resolve(LabelViewModel.self)!,
                resolver.resolve(LabelCoordinator.self)!,
                resolver.resolve(NotificationCenterWrapper.self)!
            )
        }
    }
}
