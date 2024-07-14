//
//  HomeDomainMapperImpl.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 10-07-24.
//

import Foundation

final class HomeDomainMapperImpl: HomeDomainMapper {
    func presentationToDomain(_ value: UIHomeMenuRequest) -> DomainHomeMenuRequest {
        return DomainHomeMenuRequest(
            app: value.app)
    }

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
}
