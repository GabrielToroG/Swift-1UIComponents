//
//  SceneDelegate.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 18-02-24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: InitCoordinator?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = (scene as? UIWindowScene) else { return }
        // Variables for dependency injection
        let injection = Injection.shared
        let container = injection.getContainer()

        // Configure UINavigationController
        let navController = UINavigationController()
        configNavigationController(navController)

        // Dependency injection
        coordinator = InitCoordinator(navigationController: navController, container: container)
        injection.controllerProvider.inject(initCoordinator: coordinator)
        coordinator?.start()

        // Configure the window
        let window = UIWindow(windowScene: scene)
        window.rootViewController = navController
        window.makeKeyAndVisible()
        self.window = window
    }

    private func configNavigationController(_ navController: UINavigationController) {
        // Cambiar estilos al botón "Back"
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [
            .font: Fonts.Heading.backButton,
            .foregroundColor: UIColor.blackColor
        ]

        // Cambiar estilos
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.blackColor,
            NSAttributedString.Key.font: Fonts.Heading.heading2,
        ]
        standardAppearance.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.blackColor,
            NSAttributedString.Key.font: Fonts.Heading.heading1,
        ]
        standardAppearance.backButtonAppearance = backButtonAppearance
        standardAppearance.configureWithOpaqueBackground()          // So that it does not become lighter
        standardAppearance.backgroundColor = UIColor.brandColor
        standardAppearance.shadowColor = .clear                     // delete border bottom
        navController.navigationBar.standardAppearance = standardAppearance
        navController.navigationBar.scrollEdgeAppearance = standardAppearance
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.tintColor = UIColor.blackColor  // change color to left header, when large titles
    }
}

