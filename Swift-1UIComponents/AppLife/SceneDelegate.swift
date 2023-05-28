//
//  SceneDelegate.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: HomeCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        // Variables for dependency injection
        let injection = Injection.shared
        let container = injection.getContainer()

        // Configure UINavigationController
        let navController = UINavigationController()
        configNavigationController(navController)
        

        // Dependency injection
        coordinator = HomeCoordinator(navigationController: navController, container: container)
        Injection.shared.controllerProvider.inject(homeCoordinator: coordinator)
        coordinator?.start()

        // Configure the window
        let window = UIWindow(windowScene: scene)
        window.rootViewController = navController
        window.makeKeyAndVisible()
        self.window = window

    }

    private func configNavigationController(_ navController: UINavigationController) {
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.montserratSemibold16,
        ]
        standardAppearance.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.blackColor,
            NSAttributedString.Key.font: UIFont.montserratSemibold30,
        ]
        standardAppearance.configureWithOpaqueBackground()          // So that it does not become lighter
        standardAppearance.backgroundColor = UIColor.brandColor
        standardAppearance.shadowColor = .clear                     // delete border bottom
        navController.navigationBar.standardAppearance = standardAppearance
        navController.navigationBar.scrollEdgeAppearance = standardAppearance
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.tintColor = UIColor.blackColor  // change color to left header, when large titles
    }
}

