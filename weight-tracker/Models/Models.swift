//
//  Models.swift
//  weight-tracker
//
//  Created by Media Guest on 06.07.2021.
//

import Foundation
enum HTTPError: LocalizedError {
    case statusCode
    case post
}

struct Post: Codable {

    let id: Int
    let title: String
    let body: String
    let userId: Int
}

struct Todo: Codable {

    let id: Int
    let title: String
    let completed: Bool
    let userId: Int
}
