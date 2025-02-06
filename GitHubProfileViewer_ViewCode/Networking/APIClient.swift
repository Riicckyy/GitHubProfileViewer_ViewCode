//
//  APIClient.swift
//  GitHubProfileViewer_ViewCode
//
//  Created by Marcos Henrique Rossi Paes on 06/02/25.
//

import Foundation

enum APIError: Error {
    case userNotFound
    case networkError
}

class APIClient {
    static func fetchUser(username: String, completion: @escaping (Result<User, APIError>) -> Void) {
        let urlString = "https://api.github.com/users/\(username)/repos"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.networkError))
                return
            }

            guard let data = data else {
                completion(.failure(.networkError))
                return
            }

            do {
                let repositories = try JSONDecoder().decode([Repository].self, from: data)
                let user = User(name: username, avatarURL: "https://github.com/\(username).png", repositories: repositories)
                completion(.success(user))
            } catch {
                completion(.failure(.userNotFound))
            }
        }.resume()
    }
}
