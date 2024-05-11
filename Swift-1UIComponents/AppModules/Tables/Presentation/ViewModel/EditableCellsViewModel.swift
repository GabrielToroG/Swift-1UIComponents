//
//  EditableCellsViewModel.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 09-05-24.
//

import Foundation

final class EditableCellsViewModel: BaseViewModel {
    
    @Published private(set) var refreshData: Bool?
    @Published private(set) var isActive: Bool = false
    @Published private(set) var deletedDone: [IndexPath] = []
    
    private(set) var cellData: [UIEditModeCell] = []
}

extension EditableCellsViewModel {
    func onViewDidLoad() {
        cellData = [
            UIEditModeCell(
                product: "Crema",
                description: "Esta es una descripción larga",
                price: "3000"),
            UIEditModeCell(
                product: "Shampoo",
                description: "Esta es una descripción mega larga",
                price: "2000"),
            UIEditModeCell(
                product: "Jabón",
                description: "Esta es una descripción mega mega mega mega mega larga",
                price: "1000"),
            UIEditModeCell(
                product: "Papel",
                description: "Esta es una descripción mega mega mega mega mega larga",
                price: "500"),
            UIEditModeCell(
                product: "Peineta",
                description: "Esta es una descripción mega mega mega mega mega larga",
                price: "700")
        ]
        refreshData = true
    }
}

extension EditableCellsViewModel {
    func toggleIsActive() {
        isActive.toggle()
    }
}

extension EditableCellsViewModel {
    func removeCells(at indexPaths: [IndexPath]) {
        let indices = indexPaths.map { $0.row }
        let validIndices = indices.filter {
            $0 >= .zero &&
            $0 < cellData.count
        }

        for index in validIndices {
            cellData.remove(at: index)
        }

        deletedDone = indexPaths
    }
}
