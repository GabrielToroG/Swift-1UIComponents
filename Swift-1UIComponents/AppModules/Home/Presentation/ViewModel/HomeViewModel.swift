//
//  HomeViewModel.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 18-02-24.
//

import Foundation

final class HomeViewModel: BaseViewModel {
    private enum Constants {
        static let dispatchTime: Double = 5
    }
    @Published private(set) var goTo: HomeCoordinator.GoToScene?
    @Published private(set) var homeOptions: [UiHomeOption]?

    // override
    override func onViewDidLoad() {
        super.onViewDidLoad()
        self.isLoadingSubject.send(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.dispatchTime) { [weak self] in
            guard let self = self else { return }
            self.isLoadingSubject.send(false)
            self.homeOptions = [
                UiHomeOption(icon: Asset.Home.homeLabelOption.image, title: L10n.Home.labelOption),
                UiHomeOption(icon: Asset.Home.homeImageOption.image, title: L10n.Home.imageOption),
                UiHomeOption(icon: Asset.Home.homeViewOption.image, title: L10n.Home.viewOption),
                UiHomeOption(icon: Asset.Home.homeProgressBarOption.image, title: L10n.Home.progressBarOption),
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

extension HomeViewModel {
    func goToLabelView() {
        self.goTo = .labelsView
    }
    
    func goToImagesView() {
        self.goTo = .imagesView
    }

    func goToViewsView() {
        self.goTo = .viewsView
    }

    func goToProgressBarsView() {
        self.goTo = .progressBarView
    }

    func goToButtonsView() {
        self.goTo = .buttonsView
    }

    func goToTextFieldsView() {
        self.goTo = .textFieldsView
    }

    func goToTablesMenuView() {
        self.goTo = .tablesMenu
    }
}
