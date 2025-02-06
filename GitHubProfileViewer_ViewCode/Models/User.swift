//
//  User.swift
//  GitHubProfileViewer_ViewCode
//
//  Created by Marcos Henrique Rossi Paes on 06/02/25.
//

import Foundation

// Modelo de dados do usuário
struct User: Decodable {
    let name: String
    let avatarURL: String
    let repositories: [Repository]

    enum CodingKeys: String, CodingKey {
        case name
        case avatarURL = "avatar_url"
        case repositories
    }
}
