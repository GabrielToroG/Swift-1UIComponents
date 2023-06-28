//
//  ServiceLayer.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-06-23.
//

import Foundation
import UIKit

class ServiceLayer {
    func requestUsingMock<T: Decodable>(
        jsonName: String,
        model: T.Type
    ) -> T? {
        guard let url = Bundle.main.url(forResource: jsonName, withExtension: "json") else {
            return nil
        }
        do {
            let data = try Data(contentsOf: url)
            let jsonDecoder = JSONDecoder()
            do {
                let responseModel = try jsonDecoder.decode(T.self, from: data)
                return responseModel
            } catch {
                print("json mock error: \(error)")
                return nil
            }
        } catch {
            return nil
        }
    }
}
