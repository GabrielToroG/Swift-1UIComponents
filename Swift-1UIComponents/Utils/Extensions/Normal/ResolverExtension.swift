//
//  ResolverExtension.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 13-07-24.
//

import Swinject

extension Resolver {
    func resolve<Service>(_ serviceType: Service.Type, name: String? = nil) -> Service {
        guard let service = resolve(serviceType, name: name) else {
            fatalError("The services for \(String(describing: Service.self)) should be registered")
        }

        return service
    }
}
