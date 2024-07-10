//
//  NetworkModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-07-24.
//

import Swinject

final class NetworkModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }
    
    func inject() {
        injectPresentation()
    }
}

private extension NetworkModule {
    func injectPresentation() {
        container.register(NetworkManager.self) { _ in
            NetworkManagerImpl()
        }
    }
}
