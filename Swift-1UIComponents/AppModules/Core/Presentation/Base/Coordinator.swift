//
//  Coordinator.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import UIKit
import Swinject

public final class Coordinator {
    private let container: Container
    weak var viewController: UIViewController?

    public init(
        container: Container
    ) {
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
        _ args: T
    ) -> V {
        container.resolve(V.self, name: name, argument: args)!
    }

    // MARK: - Push

    public func pushViewController<V: UIViewController>(
        newViewControllerType: V.Type,
        name: String? = nil
    ) {
        let newViewController = resolveArguments(newViewControllerType, name)
        viewController?.navigationController?.pushViewController(
            newViewController,
            animated: true)
    }

    public func pushViewController<V: UIViewController, T>(
        newViewControllerType: V.Type,
        name: String? = nil,
        arg: T
    ) {
        let newViewController = resolveArguments(newViewControllerType, name, arg)
        viewController?.navigationController?.pushViewController(
            newViewController,
            animated: true)
    }

    // MARK: - Push Detail

    public func pushDetailViewController<V: UIViewController>(
        newViewControllerType: V.Type,
        name: String? = nil
    ) {
        let newViewController = resolveArguments(newViewControllerType, name)
        newViewController.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(newViewController, animated: true)
    }

    public func pushDetailViewController<V: UIViewController, T>(
        newViewControllerType: V.Type,
        name: String? = nil,
        arg: T
    ) {
        let newViewController = resolveArguments(newViewControllerType, name, arg)
        newViewController.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(newViewController, animated: true)
    }

    // MARK: - Present like bottom sheet

//    public func presentLikeBottomSheet<V: UIViewController>(
//        newViewControllerType: V.Type,
//        name: String? = nil,
//        delegateArgs: BottomTransitioningDelegate.Args
//    ) {
//        let newViewController = resolveArguments(newViewControllerType, name)
//        let transitionDelegate = BottomTransitioningDelegate(args: delegateArgs)
//        newViewController.modalPresentationStyle = .custom
//        newViewController.transitioningDelegate = transitionDelegate
//        viewController?.present(newViewController, animated: true, completion: nil)
//    }
//
//    public func presentLikeBottomSheet<V: UIViewController, T>(
//        newViewControllerType: V.Type,
//        name: String? = nil,
//        arg: T,
//        delegateArgs: BottomTransitioningDelegate.Args
//    ) {
//        let newViewController = resolveArguments(newViewControllerType, name, arg)
//        let transitionDelegate = BottomTransitioningDelegate(args: delegateArgs)
//        newViewController.modalPresentationStyle = .custom
//        newViewController.transitioningDelegate = transitionDelegate
//        viewController?.present(newViewController, animated: true, completion: nil)
//    }

    // MARK: - Present like new navigation

    public func presentLikeNewNavigation<V: UIViewController>(
        newViewControllerType: V.Type,
        name: String? = nil
    ) {
        let newViewController = resolveArguments(newViewControllerType, name)
        let nv = UINavigationController.init(rootViewController: newViewController)
        nv.modalTransitionStyle = .crossDissolve
        nv.modalPresentationStyle = .fullScreen
        viewController?.present(nv, animated: true, completion: nil)
    }

    public func presentLikeNewNavigation<V: UIViewController, T>(
        newViewControllerType: V.Type,
        name: String? = nil,
        arg: T
    ) {
        let newViewController = resolveArguments(newViewControllerType, name, arg)
        let nv = UINavigationController.init(rootViewController: newViewController)
        nv.modalTransitionStyle = .crossDissolve
        nv.modalPresentationStyle = .fullScreen
        viewController?.present(nv, animated: true, completion: nil)
    }

    // MARK: - Present

    public func present<V: UIViewController>(
        newViewControllerType: V.Type,
        name: String? = nil
    ) {
        present(
            newViewControllerType: newViewControllerType,
            name: name,
            modalPresentationStyle: .fullScreen,
            modalTransitionStyle: .crossDissolve)
    }

    public func present<V: UIViewController>(
        newViewControllerType: V.Type,
        name: String? = nil,
        modalPresentationStyle: UIModalPresentationStyle
    ) {
        present(
            newViewControllerType: newViewControllerType,
            name: name,
            modalPresentationStyle: modalPresentationStyle,
            modalTransitionStyle: .crossDissolve)
    }

    public func present<V: UIViewController, T>(
        newViewControllerType: V.Type,
        name: String? = nil,
        arg: T
    ) {
        present(
            newViewControllerType: newViewControllerType,
            name: name,
            arg: arg,
            modalPresentationStyle: .fullScreen,
            modalTransitionStyle: .crossDissolve)
    }

    public func present<V: UIViewController, T>(
        newViewControllerType: V.Type,
        name: String? = nil,
        arg: T,
        modalPresentationStyle: UIModalPresentationStyle
    ) {
        present(
            newViewControllerType: newViewControllerType,
            name: name,
            arg: arg,
            modalPresentationStyle: modalPresentationStyle,
            modalTransitionStyle: .crossDissolve)
    }

    public func present<V: UIViewController>(
        newViewControllerType: V.Type,
        name: String? = nil,
        modalPresentationStyle: UIModalPresentationStyle,
        modalTransitionStyle: UIModalTransitionStyle
    ) {
        let newViewController = resolveArguments(newViewControllerType, name)
        newViewController.modalPresentationStyle = modalPresentationStyle
        newViewController.modalTransitionStyle = modalTransitionStyle
        viewController?.present(newViewController, animated: true, completion: nil)
    }

    public func present<V: UIViewController, T>(
        newViewControllerType: V.Type,
        name: String? = nil,
        arg: T,
        modalPresentationStyle: UIModalPresentationStyle,
        modalTransitionStyle: UIModalTransitionStyle
    ) {
        let newViewController = resolveArguments(newViewControllerType, name, arg)
        newViewController.modalPresentationStyle = modalPresentationStyle
        newViewController.modalTransitionStyle = modalTransitionStyle
        viewController?.present(newViewController, animated: true, completion: nil)
    }
}
