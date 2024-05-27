//
//  ViewsCoordinator.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 04-03-24.
//

import UIKit

final class ViewsCoordinator: Coordinator {
    indirect enum GoToScene: Equatable {
        case showAlert
        case modalFeedback(ModalFeedbackArgs)
    }

    func goToScene(
        scene: GoToScene,
        from viewController: UIViewController
    ) {
        switch scene {
        case .showAlert:
            let alertController = UIAlertController(
                title: L10n.Views.alertTitle,
                message: L10n.Views.alertMessage,
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(
                title: L10n.Views.alertAction,
                style: .cancel,
                handler: nil
            )
            alertController.addAction(okAction)
            viewController.present(alertController, animated: true, completion: nil)

        case .modalFeedback(let args):
            presentLikeBottomSheet(
                viewController: viewController,
                newViewControllerType: ModalFeedbackViewController.self,
                args: [args],
                style: .pageSheet,
                animated: true
            )
        }
    }
}
