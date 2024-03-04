//
//  HomeCoordinator.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-02-24.
//

import UIKit

final class HomeCoordinator: Coordinator {
    indirect enum GoToScene: Equatable {
        case labelsView
        case ImagesView
    }

    func goToScene(
        scene: GoToScene,
        from viewController: UIViewController
    ) {
        switch scene {
        case .labelsView:
            pushViewController(
                viewController: viewController,
                newViewControllerType: LabelsViewController.self,
                animated: true
            )
        case .ImagesView:
            pushViewController(
                viewController: viewController,
                newViewControllerType: ImagesViewController.self,
                animated: true
            )
        }
    }
}
