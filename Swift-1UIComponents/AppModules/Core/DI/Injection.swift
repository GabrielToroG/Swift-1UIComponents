//
//  Injection.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import Foundation
import Swinject

final class Injection {
    static let shared = Injection()
    private let container: Container
    let controllerProvider: MainControllerProvider

    private init() {
        container = Container()
        controllerProvider = .init(container)
        injectDependencies()
    }

    private func injectDependencies() {
        MainModule(container).inject()
        HomeModule(container).inject()
        LabelsModule(container).inject()
        ButtonsModule(container).inject()
        TextFieldsModule(container).inject()
        SwitchModule(container).inject()
        ImagesModule(container).inject()
        ToastModule(container).inject()
        ViewsModule(container).inject()
        TablesViewModule(container).inject()
    }
    
    func getContainer() -> Container {
        return container
    }

    func resolve<T>(_ serviceType: T.Type) -> T {
      return container.resolve(serviceType)!
    }
    
//    func inject(tabBarCoordinator: MainTabBarCoordinator?) {
//        container.register(MainTabBarCoordinator?.self) { _ in
//            tabBarCoordinator
//        }
//    }
}
