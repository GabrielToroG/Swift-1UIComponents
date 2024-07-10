//
//  NetworkManager.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 02-07-24.
//

import Foundation

protocol NetworkManager {
    func request<R: Decodable>(
        endpoint: String,
        method: HttpMethod,
        headerType: ApiHeaderType,
        onCompletion: @escaping (ApiResult<R>) -> Void
    )
    
    func requestWithQueryParams<R: Decodable>(
        endpoint: String,
        method: HttpMethod,
        headerType: ApiHeaderType,
        queryParams: [String: Any],
        onCompletion: @escaping (ApiResult<R>) -> Void
    )
}
