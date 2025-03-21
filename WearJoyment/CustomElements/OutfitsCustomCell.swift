//
//  OutfitsCustomCell.swift
//  WearJoyment
//
//  Created by Полина Соколова on 19.03.25.
//

import UIKit

final class OutfitsCustomCell: UITableViewCell {
    
    static let reuseIdentifier = "OutfitsCustomCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorsConstants.white
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = ColorsConstants.darkGray.cgColor
        view.layer.shadowColor = ColorsConstants.darkGray.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .thin)
        label.numberOfLines = 0
        label.textColor = ColorsConstants.darkGray 
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(with outfit: OutfitModel) {
        nameLabel.text = outfit.name
    }
    
    // MARK: - Setup View
    private func setupView() {
        contentView.backgroundColor = ColorsConstants.darkBlue
        contentView.addSubview(containerView)
        containerView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            nameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12)
        ])
    }
}

