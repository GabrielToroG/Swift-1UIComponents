//
//  TablesViewModel.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 01-04-24.
//

import Foundation

final class TablesViewModel: BaseViewModel {
    @Published private(set) var goTo: TablesViewCoordinator.GoToScene?
}

extension TablesViewModel {
    func onViewDidLoad() {
        
    }
}

extension TablesViewModel {
    func goToStickyHeadersView() {
        self.goTo = .stickyHeaders
    }

    func goToScrollableHeadersView() {
        self.goTo = .scrollableHeaders
    }

    func goToReactiveSectionsView() {
        self.goTo = .reactiveSections
    }

    func goToEditableCellsView() {
        self.goTo = .editableCells
    }

    func goToSwipableCellsView() {
        self.goTo = .swipebleCells
    }
}
