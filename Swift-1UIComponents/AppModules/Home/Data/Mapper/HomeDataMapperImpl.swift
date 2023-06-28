//
//  HomeDataMapperImpl.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-06-23.
//

import Foundation

final class HomeDataMapperImpl: HomeDataMapper {
    func dataToDomain(_ value: DataHomeOptions) -> DomainHomeOptions {
        return DomainHomeOptions(
            options: value.options.map(dataToDomain(_:)))
    }
    private func dataToDomain(_ value: DataHomeOption) -> DomainHomeOption {
        return DomainHomeOption(
            icon: value.icon,
            title: value.title
        )
    }
}
