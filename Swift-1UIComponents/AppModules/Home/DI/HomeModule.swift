//
//  HomeModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 19-02-24.
//

import Foundation
import Swinject

final class HomeModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        injectData()
        injectDomain()
        injectPresentation()
    }
}

private extension HomeModule {
    func injectData() {
        container.register(HomeRemoteDataSource.self) { resolver in
            HomeRemoteDataSourceImpl(
                manager: resolver.resolve(NetworkManager.self)
            )
        }

        container.register(HomeLocalDataSource.self) { resolver in
            HomeLocalDataSourceImpl(
                fileStorage: resolver.resolve(DirectoryLocalStorage.self)
            )
        }

        container.register(HomeDataSource.self) { resolver in
            HomeRepository(
                remote: resolver.resolve(HomeRemoteDataSource.self),
                local: resolver.resolve(HomeLocalDataSource.self),
                mapper: resolver.resolve(HomeDataMapper.self)
            )
        }

        container.register(HomeDataMapper.self) { _ in
            HomeDataMapperImpl()
        }
    }

    func injectDomain() {
        container.register(HomeDomainMapper.self) { _ in
            HomeDomainMapperImpl()
        }

        container.register(
            GetHomeMenuUseCase.Alias.self,
            name: GetHomeMenuUseCase.identifier
        ) { resolver in
            GetHomeMenuUseCase.Alias(
                GetHomeMenuUseCase(
                    repository: resolver.resolve(HomeDataSource.self),
                    mapper: resolver.resolve(HomeDomainMapper.self)
                )
            )
        }

        container.register(
            GetLocalHomeMenuUseCase.Alias.self,
            name: GetLocalHomeMenuUseCase.identifier
        ) { resolver in
            GetLocalHomeMenuUseCase.Alias(
                GetLocalHomeMenuUseCase(
                    repository: resolver.resolve(HomeDataSource.self),
                    mapper: resolver.resolve(HomeDomainMapper.self)
                )
            )
        }

        container.register(
            SaveLocalHomeMenuUseCase.Alias.self,
            name: SaveLocalHomeMenuUseCase.identifier
        ) { resolver in
            SaveLocalHomeMenuUseCase.Alias(
                SaveLocalHomeMenuUseCase(
                    repository: resolver.resolve(HomeDataSource.self),
                    mapper: resolver.resolve(HomeDomainMapper.self)
                )
            )
        }
    }

    func injectPresentation() {
        container.register(HomeViewModel.self) { resolver in
            HomeViewModel(
                getHomeMenuUseCase: resolver.resolve(
                    GetHomeMenuUseCase.Alias.self,
                    name: GetHomeMenuUseCase.identifier
                ),
                getLocalHomeMenuUseCase: resolver.resolve(
                    GetLocalHomeMenuUseCase.Alias.self,
                    name: GetLocalHomeMenuUseCase.identifier
                ),
                saveLocalHomeMenuUseCase: resolver.resolve(
                    SaveLocalHomeMenuUseCase.Alias.self,
                    name: SaveLocalHomeMenuUseCase.identifier
                ),
                mapper: resolver.resolve(HomePresentationMapper.self)
            )
        }

        container.register(HomeCoordinator.self) { _ in
            HomeCoordinator(container: self.container)
        }

        container.register(HomePresentationMapper.self) { _ in
                HomePresentationMapperImpl()
        }

        container.register(HomeViewController.self) { resolver in
            HomeViewController(
                resolver.resolve(HomeViewModel.self),
                resolver.resolve(HomeCoordinator.self),
                resolver.resolve(NotificationCenterWrapper.self)
            )
        }
    }
}
