//
//  RepositoryCell.swift
//  GitHubProfileViewer_ViewCode
//
//  Created by Marcos Henrique Rossi Paes on 06/02/25.
//

import UIKit

// Célula personalizada para exibir repositórios
class RepositoryCell: UITableViewCell {
    private let nameLabel = UILabel()
    private let languageLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Configura as views da célula
    private func setupViews() {
        // Configuração do nome do repositório
        nameLabel.font = .boldSystemFont(ofSize: 16)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        // Configuração da linguagem do repositório
        languageLabel.font = .systemFont(ofSize: 14)
        languageLabel.textColor = .gray
        languageLabel.translatesAutoresizingMaskIntoConstraints = false

        // Adiciona as views à hierarquia
        contentView.addSubview(nameLabel)
        contentView.addSubview(languageLabel)

        // Configuração das constraints
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),

            languageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            languageLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
            languageLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor),
            languageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    // Configura a célula com os dados do repositório
    func configure(with repository: Repository) {
        nameLabel.text = repository.name
        languageLabel.text = repository.language
    }
}
