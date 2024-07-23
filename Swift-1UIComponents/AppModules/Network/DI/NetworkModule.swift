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
        injectData()
    }
}

private extension NetworkModule {
    func injectData() {
        container.register(NetworkManager.self) { _ in
            NetworkManagerImpl()
        }

        container.register(DirectoryLocalStorage.self) { _ in
            FilesDirectoryStorage()
        }
    }
}
