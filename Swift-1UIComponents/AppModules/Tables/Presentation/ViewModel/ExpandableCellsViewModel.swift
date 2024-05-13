//
//  ExpandableCellsViewModel.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 12-05-24.
//

import Foundation

final class ExpandableCellsViewModel: BaseViewModel {

    // Properties
    private(set) var cellData: [UIExpandableModeCell] = [
        UIExpandableModeCell(
            leftViewTitle: "Titulo verde 1",
            leftViewActived: false,
            rightViewTitle: "Titulo rojo 1",
            rightViewActived: false
        ),
        UIExpandableModeCell(
            leftViewTitle: "Titulo verde 2",
            leftViewActived: false,
            rightViewTitle: "Titulo rojo 2",
            rightViewActived: false
        ),
        UIExpandableModeCell(
            leftViewTitle: "Titulo verde 3",
            leftViewActived: false,
            rightViewTitle: "Titulo rojo 3",
            rightViewActived: false
        )
    ]

    // Combine
    @Published private(set) var refreshData: Bool = false
}

// MARK: - Cell functions
extension ExpandableCellsViewModel {
    func updateLeftViewActiveState(at index: Int) {
        guard index < cellData.count else { return }

        var updatedCellData = cellData[index]
        if updatedCellData.leftViewActived {
            updatedCellData.leftViewActived = false
        } else if updatedCellData.rightViewActived {
            updatedCellData.leftViewActived = true
            updatedCellData.rightViewActived = false
        } else {
            updatedCellData.leftViewActived = true
        }

        cellData[index] = updatedCellData
        refreshData = true
    }

    func updateRightViewActiveState(at index: Int) {
        guard index < cellData.count else { return }

        var updatedCellData = cellData[index]
        if updatedCellData.rightViewActived {
            updatedCellData.rightViewActived = false
        } else if updatedCellData.leftViewActived {
            updatedCellData.leftViewActived = false
            updatedCellData.rightViewActived = true
        } else {
            updatedCellData.rightViewActived = true
        }

        cellData[index] = updatedCellData
        refreshData = true
    }
}
