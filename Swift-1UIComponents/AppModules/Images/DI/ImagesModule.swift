//
//  ImagesModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-02-24.
//

import Swinject

final class ImagesModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }
    
    func inject() {
        injectPresentation()
    }
}

private extension ImagesModule {
    func injectPresentation() {
        container.register(ImagesViewModel.self) { resolver in
            ImagesViewModel()
        }

        container.register(ImagesCoordinator.self) { _ in
            ImagesCoordinator(container: self.container)
        }
        container.register(ImagesViewController.self) { resolver in
            ImagesViewController(
                resolver.resolve(ImagesViewModel.self)!,
                resolver.resolve(ImagesCoordinator.self)!,
                resolver.resolve(NotificationCenterWrapper.self)!
            )
        }
    }
}
