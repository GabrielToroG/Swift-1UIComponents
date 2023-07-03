//
//  NetworkError.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-06-23.
//

import Foundation

enum NetworkError: String, Error{
    case invalidURL
    case serializationFailed
    case generic
    case couldNotDecodeData
    case httpResponseError
    case statusCodeError = "El token de acceso a expirado"
    case jsonDecoder = "Error al intentar extraer datos de json."
    case unauthorized
}
