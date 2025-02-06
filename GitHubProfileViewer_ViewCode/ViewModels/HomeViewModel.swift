//
//  HomeViewModel.swift
//  GitHubProfileViewer_ViewCode
//
//  Created by Marcos Henrique Rossi Paes on 06/02/25.
//

import Foundation

// ViewModel para a tela inicial
class HomeViewModel {
    var username: String = ""

    // Cria o ViewModel do perfil com base no nome de usuário
    func createProfileViewModel(completion: @escaping (ProfileViewModel?) -> Void) {
        guard !username.isEmpty else {
            completion(nil)
            return
        }

        APIClient.fetchUser(username: username) { result in
            switch result {
            case .success(let user):
                let profileViewModel = ProfileViewModel(user: user)
                completion(profileViewModel)
            case .failure:
                completion(nil)
            }
        }
    }
}
