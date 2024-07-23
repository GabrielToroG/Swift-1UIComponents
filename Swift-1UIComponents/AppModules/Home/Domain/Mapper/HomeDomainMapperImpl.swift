//
//  HomeDomainMapperImpl.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 10-07-24.
//

import Foundation

final class HomeDomainMapperImpl: HomeDomainMapper {
    // Home Menu Request
    func presentationToDomain(_ value: UIHomeMenuRequest) -> DomainHomeMenuRequest {
        return DomainHomeMenuRequest(
            app: value.app)
    }

    // Home Menu Data
    func domainToPresentation(_ value: DomainHomeMenu) -> UiHomeMenu {
        return UiHomeMenu(
            options: value.options.map(domainToPresentation(_:)))
    }

    private func domainToPresentation(_ value: DomainHomeOption) -> UiHomeOption {
        return UiHomeOption(
            icon:  value.icon,
            title: value.title
        )
    }

    func domainToData(_ value: DomainHomeMenu) -> ApiHomeMenu {
        return ApiHomeMenu(options: value.options.map(domainToData(_:)))
    }

    private func domainToData(_ value: DomainHomeOption) -> ApiHomeOption {
        return ApiHomeOption(
            icon: value.icon,
            title: value.title
        )
    }
}
