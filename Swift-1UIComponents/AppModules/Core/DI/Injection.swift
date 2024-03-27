//
//  Injection.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 18-02-24.
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
        LabelModule(container).inject()
        ImagesModule(container).inject()
        ViewsModule(container).inject()
        ButtonsModule(container).inject()
        TextFieldsModule(container).inject()
    }
    
    func getContainer() -> Container {
        return container
    }

    func resolve<T>(_ serviceType: T.Type) -> T {
      return container.resolve(serviceType)!
    }
}
