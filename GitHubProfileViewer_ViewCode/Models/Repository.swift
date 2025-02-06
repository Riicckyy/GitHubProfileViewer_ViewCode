//
//  Repository.swift
//  GitHubProfileViewer_ViewCode
//
//  Created by Marcos Henrique Rossi Paes on 06/02/25.
//

import Foundation

// Modelo de dados do repositório
struct Repository: Decodable {
    let name: String
    let language: String?
}
