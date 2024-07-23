//
//  DirectoryLocalStorage.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 15-07-24.
//

import Foundation

enum DirectoryLocalStorageOption {
    case caches
    case documents
}

protocol DirectoryLocalStorage {
    func save<T: Codable>(
        _ value: T?,
        key: LocalStorageKeys.Files,
        directory: DirectoryLocalStorageOption
    )
    func load<T: Codable>(
        _ type: T.Type,
        key: LocalStorageKeys.Files,
        directory: DirectoryLocalStorageOption
    ) -> T?
    func delete(
        directory: DirectoryLocalStorageOption
    ) -> Bool
    func delete(
        key: LocalStorageKeys.Files,
        directory: DirectoryLocalStorageOption
    ) -> Bool
    func contains(
        key: LocalStorageKeys.Files,
        directory: DirectoryLocalStorageOption
    ) -> Bool
}
