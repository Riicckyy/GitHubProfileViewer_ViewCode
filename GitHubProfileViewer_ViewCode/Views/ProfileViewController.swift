//
//  ProfileViewController.swift
//  GitHubProfileViewer_ViewCode
//
//  Created by Marcos Henrique Rossi Paes on 06/02/25.
//

import UIKit

// ViewController para a tela de detalhes do perfil
class ProfileViewController: UIViewController, UITableViewDataSource {
    private let viewModel: ProfileViewModel
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let tableView = UITableView()
    private let headerView = UIView()

    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        configureViews()
    }

    // Configura as views da tela de detalhes do perfil
    private func setupViews() {
        // Configuração do header view
        headerView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        headerView.translatesAutoresizingMaskIntoConstraints = false

        // Configuração da imagem do usuário
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.darkGray.cgColor
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        // Configuração do nome do usuário
        nameLabel.textAlignment = .center
        nameLabel.font = .boldSystemFont(ofSize: 16) // Fonte diminuída
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        // Configuração da tabela de repositórios
        tableView.dataSource = self
        tableView.register(RepositoryCell.self, forCellReuseIdentifier: "RepositoryCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false

        // Adiciona as views à hierarquia
        headerView.addSubview(imageView)
        headerView.addSubview(nameLabel)
        view.addSubview(headerView)
        view.addSubview(tableView)

        // Configuração das constraints
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 160),

            imageView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),

            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),

            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // Configura os dados da view
    private func configureViews() {
        nameLabel.text = viewModel.userName
        imageView.loadImage(from: viewModel.avatarURL)
    }

    // MARK: - UITableViewDataSource Methods

    // Retorna o número de linhas na tabela
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.repositories.count
    }

    // Configura a célula da tabela para cada repositório
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath) as! RepositoryCell
        let repo = viewModel.repositories[indexPath.row]
        cell.configure(with: repo)
        return cell
    }
}
