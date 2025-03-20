//
//  ClothingRootView.swift
//  WearJoyment
//
//  Created by Полина Соколова on 18.03.25.
//

import UIKit

final class ClothingRootView: UIView {
    
    private var collectionView: UICollectionView!
    private let reuseIdentifier = "ClothingCustomCell"
    
    private var topItems: [ItemModel] = []
    private var bottomItems: [ItemModel] = []
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(topItems: [ItemModel], bottomItems: [ItemModel]) {
        self.topItems = topItems
        self.bottomItems = bottomItems
        collectionView.reloadData()
    }
}

// MARK: - Setup View
private extension ClothingRootView {
    func setupView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(ClothingCustomCell.self, forCellWithReuseIdentifier: ClothingCustomCell.reuseIdentifier)
        collectionView.backgroundColor = UIColor(white: 0.97, alpha: 1)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
      
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .absolute(200)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(200)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 50, leading: 5, bottom: 50, trailing: 10)
        
        section.orthogonalScrollingBehavior = .continuous // Добавляем горизонтальный скролл 
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}

// MARK: - UICollectionViewDataSource
extension ClothingRootView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        section == 0 ? topItems.count : bottomItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClothingCustomCell.reuseIdentifier, for: indexPath) as? ClothingCustomCell else {
            return UICollectionViewCell()
        }
        
        let item = indexPath.section == 0 ? topItems[indexPath.item] : bottomItems[indexPath.item]
        cell.configure(with: item)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension ClothingRootView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = indexPath.section == 0 ? topItems[indexPath.item] : bottomItems[indexPath.item]
        print("Выбран: \(item.name)")
    }
}






