//
//  TextFieldsCoordinator.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 25-03-24.
//

import UIKit

final class TextFieldsCoordinator: Coordinator {
    indirect enum GoToScene: Equatable {
        case labeledView
    }

    func goToScene(
        scene: GoToScene,
        from viewController: UIViewController
    ) {
        switch scene {
        case .labeledView:
            pushViewController(
                viewController: viewController,
                newViewControllerType: LabeledTextFieldViewController.self,
                animated: true
            )
        }
    }
}
