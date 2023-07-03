//
//  TablesViewModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-06-23.
//

import Foundation

import Swinject

class TablesViewModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        injectPresentation()
    }
}

private extension TablesViewModule {
    func injectPresentation() {
        container.register(TableMenuViewModel.self) { _ in
            TableMenuViewModel()
        }
        container.register(TableMenuViewController.self) { resolver in
            let coordinator = resolver.resolve(Coordinator.self)!
            let notification = resolver.resolve(NotificationCenterWrapper.self)!
            let viewModel = resolver.resolve(TableMenuViewModel.self)!
            return TableMenuViewController(viewModel, coordinator: coordinator, notificationCenter: notification)
        }

        container.register(PlainTableViewViewModel.self) { _ in
            PlainTableViewViewModel()
        }
        container.register(PlainTableViewViewController.self) { resolver in
            let coordinator = resolver.resolve(Coordinator.self)!
            let notification = resolver.resolve(NotificationCenterWrapper.self)!
            let viewModel = resolver.resolve(PlainTableViewViewModel.self)!
            return PlainTableViewViewController(viewModel, coordinator: coordinator, notificationCenter: notification)
        }

        container.register(GroupedTableViewViewModel.self) { _ in
            GroupedTableViewViewModel()
        }
        container.register(GroupedTableViewViewController.self) { resolver in
            let coordinator = resolver.resolve(Coordinator.self)!
            let notification = resolver.resolve(NotificationCenterWrapper.self)!
            let viewModel = resolver.resolve(GroupedTableViewViewModel.self)!
            return GroupedTableViewViewController(viewModel, coordinator: coordinator, notificationCenter: notification)
        }

        container.register(InsetGroupedTableViewViewModel.self) { _ in
            InsetGroupedTableViewViewModel()
        }
        container.register(InsetGroupedTableViewViewController.self) { resolver in
            let coordinator = resolver.resolve(Coordinator.self)!
            let notification = resolver.resolve(NotificationCenterWrapper.self)!
            let viewModel = resolver.resolve(InsetGroupedTableViewViewModel.self)!
            return InsetGroupedTableViewViewController(viewModel, coordinator: coordinator, notificationCenter: notification)
        }
    }
}
