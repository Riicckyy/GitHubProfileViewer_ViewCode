//
//  HomeViewController.swift
//  GitHubProfileViewer_ViewCode
//
//  Created by Marcos Henrique Rossi Paes on 06/02/25.
//

import UIKit

class HomeViewController: UIViewController {
    private let textField = UITextField()
    private let searchButton = UIButton(type: .system)
    private let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "GitHub Viewer"
        setupViews()
    }

    private func setupViews() {
        textField.placeholder = "Enter GitHub username"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false

        searchButton.setTitle("Search", for: .normal)
        searchButton.setTitleColor(.white, for: .normal)
        searchButton.backgroundColor = .systemBlue
        searchButton.layer.cornerRadius = 8
        searchButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        searchButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(textField)
        view.addSubview(searchButton)

        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            textField.widthAnchor.constraint(equalToConstant: 200),

            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            searchButton.widthAnchor.constraint(equalToConstant: 200),
            searchButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    @objc private func searchButtonTapped() {
        viewModel.username = textField.text ?? ""
        viewModel.createProfileViewModel { [weak self] profileViewModel in
            DispatchQueue.main.async {
                guard let profileViewModel = profileViewModel else {
                    self?.showError(message: "User not found. Please enter another name")
                    return
                }
                let profileVC = ProfileViewController(viewModel: profileViewModel)
                self?.navigationController?.pushViewController(profileVC, animated: true)
            }
        }
    }

    private func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
