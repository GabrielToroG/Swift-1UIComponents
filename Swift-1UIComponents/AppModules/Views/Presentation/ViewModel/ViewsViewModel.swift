//
//  ViewsViewModel.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 04-03-24.
//

import Foundation

final class ViewsViewModel: BaseViewModel {
    @Published private(set) var goTo: ViewsCoordinator.GoToScene?

}

extension ViewsViewModel {
    func onViewDidLoad() {
        
    }
}

extension ViewsViewModel {
    func showAlert() {
        self.goTo = .showAlert
    }
}
