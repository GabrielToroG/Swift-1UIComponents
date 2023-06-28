//
//  HomeDomainMapperImpl.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-06-23.
//

import Foundation

final class HomeDomainMapperImpl: HomeDomainMapper {
    func domainToPresentation(_ value: DomainHomeOptions) -> UiHomeOptions {
        return UiHomeOptions(
            options: value.options.map(domainToPresentation(_:)))
    }
    private func domainToPresentation(_ value: DomainHomeOption) -> UiHomeOption {
        return UiHomeOption(
            icon: value.icon,
            title: value.title
        )
    }
}
