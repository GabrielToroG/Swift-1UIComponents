//
//  FilesDirectoryStorage.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 15-07-24.
//

import Foundation

final class FilesDirectoryStorage: DirectoryLocalStorage {
    func save<T: Codable>(
        _ value: T?,
        key: LocalStorageKeys.Files,
        directory: DirectoryLocalStorageOption
    ) {
        let url = getFileUrl(for: directory, key: key)
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        do {
            let data = try encoder.encode(value)
            if FileManager.default.fileExists(atPath: url.path) {
                try FileManager.default.removeItem(at: url)
            }
            FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func load<T: Codable>(
        _ type: T.Type,
        key: LocalStorageKeys.Files,
        directory: DirectoryLocalStorageOption
    ) -> T? {
        let url = getFileUrl(for: directory, key: key)
        if !FileManager.default.fileExists(atPath: url.path) {
            fatalError("File at path \(url.path) does not exist!")
        }

        if let data = FileManager.default.contents(atPath: url.path) {
            let decoder = JSONDecoder()
            do {
                let model = try decoder.decode(type, from: data)
                return model
            } catch {
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("No data at \(url.path)!")
        }
    }

    func delete(directory: DirectoryLocalStorageOption) -> Bool {
        let url = getDirectoryUrl(for: directory)
        do {
            let contents = try FileManager.default.contentsOfDirectory(
                at: url,
                includingPropertiesForKeys: nil,
                options: []
            )
            for fileUrl in contents {
                try FileManager.default.removeItem(at: fileUrl)
            }
            return true
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func delete(key: LocalStorageKeys.Files, directory: DirectoryLocalStorageOption) -> Bool {
        let url = getFileUrl(for: directory, key: key)
        if FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.removeItem(at: url)
                return true
            } catch {
                fatalError(error.localizedDescription)
            }
        }
        return false
    }

    func contains(
        key: LocalStorageKeys.Files,
        directory: DirectoryLocalStorageOption
    ) -> Bool {
        let url = getFileUrl(for: directory, key: key)
        return FileManager.default.fileExists(atPath: url.path)
    }
}

private extension FilesDirectoryStorage {
    func getDirectoryUrl(for directory: DirectoryLocalStorageOption) -> URL {
        var searchPathDirectory: FileManager.SearchPathDirectory
        switch directory {
        case .documents:
            searchPathDirectory = .documentDirectory
        case .caches:
            searchPathDirectory = .cachesDirectory
        }

        if let url = FileManager.default.urls(
            for: searchPathDirectory,
            in: .userDomainMask
        ).first {
            return url
        } else {
            fatalError("Could not create URL for specified directory!")
        }
    }

    func getFileUrl(for directory: DirectoryLocalStorageOption, key: LocalStorageKeys.Files) -> URL {
        getDirectoryUrl(
            for: directory
        ).appendingPathComponent("\(key.rawValue).json", isDirectory: false)
    }
}
