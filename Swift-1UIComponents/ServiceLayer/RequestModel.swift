//
//  RequestModel.swift
//  Swift-1UIComponents
//
//  Created by Gabriel Alonso Toro Guzmán on 27-06-23.
//

import Foundation

struct RequestModel  {
    var queryItems : [String:String]?
    let httpMethod : HttpMethod = .GET
    var baseUrl : URLBase = .spotify
    let endpoint : Endpoints

    func getURL() -> String {
        return baseUrl.rawValue + endpoint.rawValue
    }

    enum Endpoints : String   {
        case auth = "/authorize?"
        case token = "/me"
        case browse = "/browse/new-releases"
        case genres = "/recommendations/available-genre-seeds"
    }

    enum URLBase : String{
        case auth = "https://accounts.spotify.com"
        case spotify = "https://api.spotify.com/v1"
    }
}

enum HttpMethod : String {
    case GET
    case POST
}
