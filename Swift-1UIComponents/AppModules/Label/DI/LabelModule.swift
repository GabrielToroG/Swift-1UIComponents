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
        container.register(LabelsViewModel.self) { resolver in
            LabelsViewModel()
        }

        container.register(LabelsCoordinator.self) { _ in
            LabelsCoordinator(container: self.container)
        }
        container.register(LabelsViewController.self) { resolver in
            LabelsViewController(
                resolver.resolve(LabelsViewModel.self)!,
                resolver.resolve(LabelsCoordinator.self)!,
                resolver.resolve(NotificationCenterWrapper.self)!
            )
        }
    }
}
