//
//  HomeViewModel.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 18-02-24.
//

import Foundation

final class HomeViewModel: BaseViewModel {
    private enum Constants {
        static let dispatchTime: Double = 3
    }
    @Published private(set) var goTo: HomeCoordinator.GoToScene?
    @Published private(set) var homeOptions: [UiHomeOption]?
}

extension HomeViewModel {
    func onViewDidLoad() {
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.dispatchTime) { [weak self] in
            guard let self = self else { return }
            self.homeOptions = [
                UiHomeOption(icon: Asset.Home.homeLabelOption.image, title: L10n.Home.labelOption),
                UiHomeOption(icon: Asset.Home.homeImageOption.image, title: L10n.Home.imageOption),
                UiHomeOption(icon: Asset.Home.homeViewOption.image, title: L10n.Home.viewOption),
                UiHomeOption(icon: Asset.Home.homeButtonOption.image, title: L10n.Home.buttonOption),
                UiHomeOption(icon: Asset.Home.homeTextfieldOption.image, title: L10n.Home.textfieldOption),
                UiHomeOption(icon: Asset.Home.homeTableOption.image, title: L10n.Home.tableOption),
                UiHomeOption(icon: Asset.Home.homeCollectionOption.image, title: L10n.Home.collectionOption),
                UiHomeOption(icon: Asset.Home.homeWebOption.image, title: L10n.Home.webOption),
                UiHomeOption(icon: Asset.Home.homeSwitchOption.image, title: L10n.Home.switchOption),
                UiHomeOption(icon: Asset.Home.homeToastOption.image, title: L10n.Home.toastOption)
            ]
        }
    }
}
