//
//  HomeViewModel.swift
//  GitHubProfileViewer_ViewCode
//
//  Created by Marcos Henrique Rossi Paes on 06/02/25.
//

import Foundation

class HomeViewModel {
    var username: String = ""

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
