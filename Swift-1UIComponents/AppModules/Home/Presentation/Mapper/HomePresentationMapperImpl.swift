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
            guard let iconEnum = HomeTableViewRows(rawValue: icon.icon) else {
                return UiHomeOptionCorrect(icon: UIImage(), title: "")
            }

            switch iconEnum {
            case .label:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeLabelOption.image,
                    title: L10n.Home.labelOption)
            case .images:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeImageOption.image,
                    title: L10n.Home.imageOption)
            case .buttons:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeButtonOption.image,
                    title: L10n.Home.buttonOption)
            case .textFields:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeTextfieldOption.image,
                    title: L10n.Home.textfieldOption)
            case .switchs:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeSwitchOption.image,
                    title: L10n.Home.switchOption)
            case .progressBars:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeProgressBarOption.image,
                    title: L10n.Home.progressBarOption)
            case .graphics:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeGraphicsOption.image,
                    title: L10n.Home.graphicsOption)
            case .tablesMenu:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeTableOption.image,
                    title: L10n.Home.tableOption)
            case .collectionsMenu:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeCollectionOption.image,
                    title: L10n.Home.collectionOption)
            case .webViews:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeWebOption.image,
                    title: L10n.Home.webOption)
            case .views:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeViewOption.image,
                    title: L10n.Home.viewOption)
            case .toast:
                return UiHomeOptionCorrect(
                    icon: Asset.Home.homeToastOption.image,
                    title: L10n.Home.toastOption)
            }
        }
    }
}
