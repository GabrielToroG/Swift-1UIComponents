//
//  ApiResult.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-07-24.
//

import Foundation

enum ApiResult<T> {
    case success(data: T)
    case error(error: ErrorType)
    case unauthorized(error: Error)
}
