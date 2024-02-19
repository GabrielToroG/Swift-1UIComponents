//
//  HomeCoordinator.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-02-24.
//

import UIKit

final class HomeCoordinator: Coordinator {
    indirect enum GoToScene: Equatable {
        case labelScreen
    }

    func goToScene(
        scene: GoToScene,
        from viewController: UIViewController
    ) {
        switch scene {
        case .labelScreen:
            pushViewController(
                viewController: viewController,
                newViewControllerType: LabelViewController.self
            )
        }
    }
}
