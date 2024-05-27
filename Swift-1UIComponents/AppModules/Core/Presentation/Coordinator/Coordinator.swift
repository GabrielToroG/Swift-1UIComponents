//
//  Coordinator.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-02-24.
//

import Foundation
import Swinject

class Coordinator {
    private let container: Container

    public init(container: Container) {
        self.container = container
    }

    private func resolveArguments<V: UIViewController>(
        _ newViewControllerType: V.Type,
        _ name: String? = nil
    ) -> V {
        container.resolve(V.self, name: name)!
    }

    private func resolveArguments<V: UIViewController, T>(
        _ newViewControllerType: V.Type,
        _ name: String? = nil,
        _ args: [T]
    ) -> V {
        container.resolve(V.self, name: name, argument: args[0])!
    }
}

// MARK: - Push
extension Coordinator {
    func pushViewController<V: UIViewController>(
        viewController: UIViewController,
        newViewControllerType: V.Type,
        animated: Bool = false
    ) {
        var newViewController: V!
        newViewController = resolveArguments(newViewControllerType)
        viewController.navigationController?.pushViewController(newViewController, animated: animated)
    }
}

// MARK: - BottomSheet
extension Coordinator {
    func presentLikeBottomSheet<V: UIViewController, T>(
        viewController: UIViewController,
        newViewControllerType: V.Type,
        args: [T],
        style: UIModalPresentationStyle = .overFullScreen,
        animated: Bool = false
    ) {
        var newViewController: V!
        newViewController = resolveArguments(newViewControllerType, nil, args)
        newViewController.modalPresentationStyle = style
        viewController.present(
            newViewController,
            animated: false,
            completion: nil)
    }
}
