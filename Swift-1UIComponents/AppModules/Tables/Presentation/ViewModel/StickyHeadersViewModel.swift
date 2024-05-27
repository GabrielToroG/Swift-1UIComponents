//
//  StickyHeadersViewModel.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 01-04-24.
//

import Foundation

final class StickyHeadersViewModel: BaseViewModel {

    @Published private(set) var stickyData: [UIStickyHeader] = []

    override func onViewDidLoad() {
        super.onViewDidLoad()
        stickyData =  [
            UIStickyHeader(title: "Primera casilla"),
            UIStickyHeader(title: "Segunda casilla"),
            UIStickyHeader(title: "Tercera casilla"),
            UIStickyHeader(title: "Casilla casilla"),
        ]
    }
}

extension StickyHeadersViewModel {
    
}
