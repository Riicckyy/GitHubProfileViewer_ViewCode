//
//  ProfileViewModel.swift
//  GitHubProfileViewer_ViewCode
//
//  Created by Marcos Henrique Rossi Paes on 06/02/25.
//

import Foundation

// ViewModel para a tela de detalhes do perfil
class ProfileViewModel {
    private let user: User

    var userName: String {
        return user.name
    }

    var avatarURL: String {
        return user.avatarURL
    }

    var repositories: [Repository] {
        return user.repositories
    }

    init(user: User) {
        self.user = user
    }
}
