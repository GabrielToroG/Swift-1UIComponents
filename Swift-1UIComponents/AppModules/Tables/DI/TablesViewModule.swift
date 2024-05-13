//
//  TablesViewModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 01-04-24.
//

import Foundation
import Swinject

final class TablesViewModule {
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
        container.register(TablesViewModel.self) { resolver in
            TablesViewModel()
        }
        container.register(TablesViewCoordinator.self) { resolver in
            TablesViewCoordinator(container: self.container)
        }
        container.register(TablesMenuViewController.self) { resolver in
            TablesMenuViewController(
                resolver.resolve(TablesViewModel.self)!,
                resolver.resolve(TablesViewCoordinator.self)!,
                resolver.resolve(NotificationCenterWrapper.self)!
            )
        }

        container.register(StickyHeadersViewModel.self) { resolver in
            StickyHeadersViewModel()
        }
        container.register(StickyHeadersViewController.self) { resolver in
            StickyHeadersViewController(
                resolver.resolve(StickyHeadersViewModel.self)!,
                resolver.resolve(TablesViewCoordinator.self)!,
                resolver.resolve(NotificationCenterWrapper.self)!
            )
        }

        container.register(ScrollableHeadersViewModel.self) { resolver in
            ScrollableHeadersViewModel()
        }
        container.register(ScrollableHeadersViewController.self) { resolver in
            ScrollableHeadersViewController(
                resolver.resolve(ScrollableHeadersViewModel.self)!,
                resolver.resolve(TablesViewCoordinator.self)!,
                resolver.resolve(NotificationCenterWrapper.self)!
            )
        }

        container.register(ReactiveSectionsViewModel.self) { resolver in
            ReactiveSectionsViewModel()
        }
        container.register(ReactiveSectionsViewController.self) { resolver in
            ReactiveSectionsViewController(
                resolver.resolve(ReactiveSectionsViewModel.self)!,
                resolver.resolve(TablesViewCoordinator.self)!,
                resolver.resolve(NotificationCenterWrapper.self)!
            )
        }

        container.register(EditableCellsViewModel.self) { resolver in
            EditableCellsViewModel()
        }
        container.register(EditableCellsViewController.self) { resolver in
            EditableCellsViewController(
                resolver.resolve(EditableCellsViewModel.self)!,
                resolver.resolve(TablesViewCoordinator.self)!,
                resolver.resolve(NotificationCenterWrapper.self)!
            )
        }

        container.register(SwipeableCellsViewModel.self) { resolver in
            SwipeableCellsViewModel()
        }
        container.register(SwipeableCellsViewController.self) { resolver in
            SwipeableCellsViewController(
                resolver.resolve(SwipeableCellsViewModel.self)!,
                resolver.resolve(TablesViewCoordinator.self)!,
                resolver.resolve(NotificationCenterWrapper.self)!
            )
        }

        container.register(ExpandableCellsViewModel.self) { resolver in
            ExpandableCellsViewModel()
        }
        container.register(ExpandableCellsViewController.self) { resolver in
            ExpandableCellsViewController(
                resolver.resolve(ExpandableCellsViewModel.self)!,
                resolver.resolve(TablesViewCoordinator.self)!,
                resolver.resolve(NotificationCenterWrapper.self)!
            )
        }
    }
}
