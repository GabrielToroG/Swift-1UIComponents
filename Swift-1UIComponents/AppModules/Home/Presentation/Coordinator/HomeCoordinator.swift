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
        case imagesView
        case viewsView
        case progressBarView
        case buttonsView
        case textFieldsView
        case tablesMenu
        case switchView
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
        case .imagesView:
            pushViewController(
                viewController: viewController,
                newViewControllerType: ImagesViewController.self,
                animated: true
            )
        case .viewsView:
            pushViewController(
                viewController: viewController,
                newViewControllerType: ViewsViewController.self,
                animated: true
            )
        case .progressBarView:
            pushViewController(
                viewController: viewController,
                newViewControllerType: ProgressBarViewController.self,
                animated: true
            )
        case .buttonsView:
            pushViewController(
                viewController: viewController,
                newViewControllerType: ButtonsViewController.self,
                animated: true
            )
        case .textFieldsView:
            pushViewController(
                viewController: viewController,
                newViewControllerType: TextFieldsViewController.self,
                animated: true
            )
        case .tablesMenu:
            pushViewController(
                viewController: viewController,
                newViewControllerType: TablesMenuViewController.self,
                animated: true
            )
        case .switchView:
            pushViewController(
                viewController: viewController,
                newViewControllerType: SwitchViewController.self,
                animated: true
            )
        }
    }
}
