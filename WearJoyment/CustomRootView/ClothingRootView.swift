//
//  ClothingRootView.swift
//  WearJoyment
//
//  Created by Полина Соколова on 18.03.25.
//

import UIKit

final class ClothingRootView: UIView {
    
    private var clothingCollectionView: UICollectionView! //проверь насколько удачно я назвала все свойства
    private let reuseIdentifier = "clothingReuseIdentifier"
    private var items: [ItemModel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(items: [ItemModel]) { //вот этот метод напомни для чего? чтобы модель передать в коллекцию?
        self.items = items
        clothingCollectionView.reloadData()
    }
}

// MARK: - Setup View
private extension ClothingRootView {
    func setupView() {
        backgroundColor = .white //это цвет всего экрана
        clothingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        clothingCollectionView.register(ClothingCustomCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        clothingCollectionView.backgroundColor = .blue //а это цвет самой коллекции
        clothingCollectionView.dataSource = self
        clothingCollectionView.delegate = self
        
        addSubview(clothingCollectionView)
    }
}

// MARK: - Setting Layout
private extension ClothingRootView {
    func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
                   if sectionIndex == 0 {
                       return self.createSection(for: .top)
                   } else {
                       return self.createSection(for: .bottom)
                   }
               }
           }

           func createSection(for type: ItemType) -> NSCollectionLayoutSection {
               let itemSize = NSCollectionLayoutSize(
                   widthDimension: .fractionalWidth(0.5),
                   heightDimension: .absolute(200)
               )
               
               let item = NSCollectionLayoutItem(layoutSize: itemSize)

               let groupSize = NSCollectionLayoutSize(
                   widthDimension: .fractionalWidth(1),
                   heightDimension: .absolute(220)
               )
               
               let group = NSCollectionLayoutGroup.horizontal(
                   layoutSize: groupSize,
                   subitems: [item]
               )
               
               group.interItemSpacing = .fixed(25)

               let section = NSCollectionLayoutSection(group: group)
               section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
               
               return section
        //return UICollectionViewCompositionalLayout(section: section) было так
    }
    
    func configureCollectionView() {
        clothingCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            clothingCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            clothingCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            clothingCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            clothingCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - CollectionViewDataSource
extension ClothingRootView: UICollectionViewDataSource {
    //количество секций
    func numberOfSections(in collectionView: UICollectionView) -> Int {
           return 2
       }
    
    //количество элементов в секции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return section == 0
                ? items.filter { $0.type == .top }.count
                : items.filter { $0.type == .bottom }.count
        }
    
    //ячейка для каждого элемента
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ClothingCustomCell.reuseIdentifier,
                for: indexPath
            ) as? ClothingCustomCell else {
                return UICollectionViewCell()
            }

            let filteredItems = indexPath.section == 0
                ? items.filter { $0.type == .top }
                : items.filter { $0.type == .bottom }

            let item = filteredItems[indexPath.row]
            cell.configure(with: item)
            return cell
    }
}

//MARK: - CollectionViewDelegate
extension ClothingRootView: UICollectionViewDelegate { //нужен он вообще?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Выбрана вещь: \(items[indexPath.row].name)")
    }
}

