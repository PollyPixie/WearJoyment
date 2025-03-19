//
//  OutfitsRootView.swift
//  WearJoyment
//
//  Created by Полина Соколова on 19.03.25.
//

import UIKit

final class OutfitsRootView: UIView {
    
    var outfits: [OutfitModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var didSelectOutfit: ((OutfitModel) -> Void)?
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(OutfitsCustomCell.self, forCellReuseIdentifier: OutfitsCustomCell.reuseIdentifier)
        return tableView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup View
    private func setupView() {
        backgroundColor = .white
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension OutfitsRootView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        outfits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OutfitsCustomCell.reuseIdentifier, for: indexPath) as? OutfitsCustomCell else {
            return UITableViewCell()
        }
        cell.configure(with: outfits[indexPath.row])
        return cell
    }
}
    
// MARK: - UITableViewDelegate
extension OutfitsRootView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedOutfit = outfits[indexPath.row]
        didSelectOutfit?(selectedOutfit)
    }
}
