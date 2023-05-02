//
//  MainModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
//

import Foundation
import Swinject

class MainModule {
    static func register(container: Container) {
        container.register(Coordinator.self) { _ in
            .init(container: container)
        }
        container.register(NotificationCenter.self) { _ in
            .default
        }
        container.register(NotificationCenterWrapper.self) { resolver in
            NotificationCenterWrapperImpl(
                notificationCenter: resolver.resolve(NotificationCenter.self)!)
        }
    }
}
