//
//  TablesViewCoordinator.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 01-04-24.
//

import UIKit

final class TablesViewCoordinator: Coordinator {
    indirect enum GoToScene: Equatable {
        case stickyHeaders
        case scrollableHeaders
        case reactiveSections
    }

    func goToScene(
        scene: GoToScene,
        from viewController: UIViewController
    ) {
        switch scene {
        case .stickyHeaders:
            pushViewController(
                viewController: viewController,
                newViewControllerType: StickyHeadersViewController.self,
                animated: true
            )
        case .scrollableHeaders:
            pushViewController(
                viewController: viewController,
                newViewControllerType: ScrollableHeadersViewController.self,
                animated: true
            )
        case .reactiveSections:
            pushViewController(
                viewController: viewController,
                newViewControllerType: ReactiveSectionsViewController.self,
                animated: true
            )
        }
    }
}
