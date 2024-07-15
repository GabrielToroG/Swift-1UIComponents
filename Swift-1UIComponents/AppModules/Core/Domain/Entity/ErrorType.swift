//
//  ErrorType.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 04-07-24.
//

import Foundation

enum ErrorType: Error {
    /// Error Interno
    case inward(_ error: InwardError)
    
    /// No se ha iniciado el backend
    case serverUnavailable

    /// 404
    case notFound


    case api(_ apiError: ApiError)

    case general(_ error: Error? = nil)


    case generic(_ error: String)
}

struct ApiError: Decodable {
    let statusCode: Int?
    let error: String?
    let message: String?
    let errorCode: String?
}

enum InwardError {
    case malformedUrl
    case decoding
    case emptyResponse
    case timeout

    var message: String {
        switch self{
        case .malformedUrl:
            return "mal formado"
        case .decoding:
            return "decoding"
        case .emptyResponse:
            return "respuesta vaica"
        case .timeout:
            return "timeout"
        }
    }
}

