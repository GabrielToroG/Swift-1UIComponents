//
//  HomeDataMapperImpl.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 10-07-24.
//

import Foundation

final class HomeDataMapperImpl: HomeDataMapper {
    func domainToData(_ value: DomainHomeMenuRequest) -> ApiHomeMenuRequest {
        return ApiHomeMenuRequest(
            app: value.app)
    }

    func dataToDomain(_ value: ApiHomeMenu) -> DomainHomeMenu {
        return DomainHomeMenu(
            options: value.options.map(dataToDomain(_:)))
    }

    private func dataToDomain(_ value: ApiHomeOption) -> DomainHomeOption {
        return DomainHomeOption(
            icon: value.icon,
            title: value.title
        )
    }
}
