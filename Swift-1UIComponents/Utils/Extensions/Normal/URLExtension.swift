//
//  URLExtension.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 04-07-24.
//

import Foundation

extension URL {
    /// init usado en getUrl()
    init?(encodedString: String) {
        guard let urlEncoded = encodedString.addingPercentEncoding(
            withAllowedCharacters: .urlQueryAllowed
        ) else {
            return nil
        }
        self.init(string: urlEncoded)
    }

    /// Definición: Obtiene las URLs de un archivo .plist llamado urlPath
    /// Lugar de uso: Para obtener el baseUrl de la api
    static func getURL(for key: URLFileKeys) -> URL {
        let fileName = "urlPath"
        let properties = readPlist(file: fileName)
        guard let urlString = properties[key.rawValue] else {
            fatalError("Cannot find `\(key)` key in `\(fileName)`")
        }
        guard let url = URL(encodedString: urlString) else {
            fatalError("Cannot create an URL: \(urlString)")
        }
        return url
    }

    /// Definición: Para leer archivos .plist
    private static func readPlist(file: String) -> [String: String] {
        guard let propertiesPath = Bundle.main.path(forResource: file, ofType: "plist"),
              let properties = NSDictionary(contentsOfFile: propertiesPath) as? [String: String]
        else {
            debugPrint("Cannot find `\(file)`")
            return [:]
        }
        return properties
    }

    enum URLFileKeys: String {
        case urlBaseDev
        case urlBaseProd
    }
}
