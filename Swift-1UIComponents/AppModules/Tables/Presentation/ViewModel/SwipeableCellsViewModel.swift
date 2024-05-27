//
//  SwipeableCellsViewModel.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 11-05-24.
//

import Foundation

final class SwipeableCellsViewModel: BaseViewModel {

    private(set) var cellData: [UISwipeableModeCell] = []

    override func onViewDidLoad() {
        super.onViewDidLoad()
        cellData = [
            UISwipeableModeCell(name: "Celda 1"),
            UISwipeableModeCell(name: "Celda 2"),
            UISwipeableModeCell(name: "Celda 3"),
            UISwipeableModeCell(name: "Celda 4"),
            UISwipeableModeCell(name: "Celda 5"),
            UISwipeableModeCell(name: "Celda 6"),
        ]
    }
}

extension SwipeableCellsViewModel {

    func removeCells(at index: Int) {
        cellData.remove(at: index)
    }
}
