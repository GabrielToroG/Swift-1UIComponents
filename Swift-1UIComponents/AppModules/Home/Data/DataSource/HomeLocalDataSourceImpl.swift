//
//  HomeLocalDataSourceImpl.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 15-07-24.
//

import Foundation

final class HomeLocalDataSourceImpl: HomeLocalDataSource {

    private let fileStorage: DirectoryLocalStorage

    init(fileStorage: DirectoryLocalStorage) {
        self.fileStorage = fileStorage
    }

    func getMenuOptions() -> ApiHomeMenu? {
        guard fileStorage.contains(key: .homeMenu, directory: .caches) else { return nil }
        return fileStorage.load(ApiHomeMenu.self, key: .homeMenu, directory: .caches)
    }
    
    func saveMenuOptions(_ menu: ApiHomeMenu) {
        fileStorage.save(menu, key: .homeMenu, directory: .caches)    }
}
