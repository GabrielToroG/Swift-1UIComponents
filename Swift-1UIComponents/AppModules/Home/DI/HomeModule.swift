//
//  HomeModule.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-05-23.
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
            HomeRemoteDataSourceImpl(manager: ServiceLayer())
        }
        container.register(HomeDataSource.self) { resolver in
            HomeRepository(
                remote: resolver.resolve(HomeRemoteDataSource.self)!,
                mapper: resolver.resolve(HomeDataMapper.self)!)
        }
        container.register(HomeDataMapper.self) { resolver in
            HomeDataMapperImpl()
        }
    }
    func injectDomain() {
        container.register(GetHomeOptionsUseCases.self) { resolver in
            GetHomeOptionsUseCases(
                repository: resolver.resolve(HomeDataSource.self)!,
                mapper: resolver.resolve(HomeDomainMapper.self)!)
        }
        container.register(HomeDomainMapper.self) { resolver in
            HomeDomainMapperImpl()
        }
    }
    func injectPresentation() {
        container.register(HomeViewModel.self) { resolver in
            let useCase = resolver.resolve(GetHomeOptionsUseCases.self)!
            return HomeViewModel(getHomeOptionsUseCases: useCase)
        }
        container.register(HomeViewController.self) { resolver in
            let coordinator = resolver.resolve(Coordinator.self)!
            let notification = resolver.resolve(NotificationCenterWrapper.self)!
            let viewModel = resolver.resolve(HomeViewModel.self)!
            return HomeViewController(viewModel, coordinator: coordinator, notificationCenter: notification)
        }
    }
}
