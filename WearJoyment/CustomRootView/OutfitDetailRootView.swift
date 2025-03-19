//
//  OutfitDetailRootView.swift
//  WearJoyment
//
//  Created by Полина Соколова on 19.03.25.
//

import UIKit

final class OutfitDetailRootView: UIView {
    
    private let topImageView = UIImageView()
    private let bottomImageView = UIImageView()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(with outfit: OutfitModel) {
        topImageView.image = UIImage(named: outfit.top.image)
        bottomImageView.image = UIImage(named: outfit.bottom.image)
    }
}

// MARK: - Setup
private extension OutfitDetailRootView {
    func setup() {
        backgroundColor = UIColor(white: 0.85, alpha: 1)
        addSubview(topImageView)
        addSubview(bottomImageView)
        
        topImageView.contentMode = .scaleAspectFit
        bottomImageView.contentMode = .scaleAspectFit
        
        setupLayout()
    }
}

// MARK: - Setup layout
private extension OutfitDetailRootView {
    func setupLayout() {
        topImageView.translatesAutoresizingMaskIntoConstraints = false
        bottomImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            topImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            topImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            topImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            topImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            
            bottomImageView.topAnchor.constraint(equalTo: topImageView.bottomAnchor, constant: 0),
            bottomImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bottomImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            bottomImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            bottomImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -20)
        ])
    }
}
