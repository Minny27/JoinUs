//
//  FetchHTMLDataError.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/23.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case invalidHTML
    case invlidDocument
    case invalidRequest
    case invalidResponse
    case invalidData
    case decodingError
    case parsingError
}
