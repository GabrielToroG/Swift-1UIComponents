//
//  HomePresentationMapperImpl.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 14-07-24.
//

import Foundation
import UIKit

final class HomePresentationMapperImpl: HomePresentationMapper {
    func format(_ value: [UiHomeOption]) -> [UiHomeOptionCorrect] {
        return value.map { icon in
            guard let element = HomeTableViewRows(rawValue: icon.icon) else {
                return UiHomeOptionCorrect(icon: UIImage(), title: "", row: "")
            }

            switch element {
            case .label:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeLabelOption.image,
                    title: L10n.Home.labelOption,
                    row: icon.title)
            case .images:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeImageOption.image,
                    title: L10n.Home.imageOption,
                    row: icon.title)
            case .buttons:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeButtonOption.image,
                    title: L10n.Home.buttonOption,
                    row: icon.title)
            case .textFields:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeTextfieldOption.image,
                    title: L10n.Home.textfieldOption,
                    row: icon.title)
            case .switchs:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeSwitchOption.image,
                    title: L10n.Home.switchOption,
                    row: icon.title)
            case .progressBars:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeProgressBarOption.image,
                    title: L10n.Home.progressBarOption,
                    row: icon.title)
            case .graphics:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeGraphicsOption.image,
                    title: L10n.Home.graphicsOption,
                    row: icon.title)
            case .tablesMenu:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeTableOption.image,
                    title: L10n.Home.tableOption,
                    row: icon.title)
            case .collectionsMenu:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeCollectionOption.image,
                    title: L10n.Home.collectionOption,
                    row: icon.title)
            case .webViews:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeWebOption.image,
                    title: L10n.Home.webOption,
                    row: icon.title)
            case .segmentedControl:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeSegmentedControlOption.image,
                    title: L10n.Home.segmentedControlOption,
                    row: icon.title
                )
            case .views:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeViewOption.image,
                    title: L10n.Home.viewOption,
                    row: icon.title)
            case .toast:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeToastOption.image,
                    title: L10n.Home.toastOption,
                    row: icon.title)
            case .serverDriven:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeServerDrivenOption.image,
                    title: L10n.Home.serverDrivenOption,
                    row: icon.title
                )
            }
        }
    }
}

extension HomePresentationMapperImpl {
    func presentationToDomain(_ value: UiHomeMenu) -> DomainHomeMenu {
        return DomainHomeMenu(
            options: value.options.map(presentationToDomain(_:)))
    }

    private func presentationToDomain(_ value: UiHomeOption) -> DomainHomeOption {
        return DomainHomeOption(
            icon:  value.icon,
            title: value.title
        )
    }
}
