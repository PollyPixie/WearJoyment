//
//  OutfitManager.swift
//  WearJoyment
//
//  Created by Полина Соколова on 17.03.25.
//

import UIKit

protocol IOutfitManager {
    func fetchOutfits() -> [OutfitModel]
}

final class OutfitManager: IOutfitManager {
    static let shared = OutfitManager()

    private var outfits: [OutfitModel] = [
        OutfitModel(
            name: "Черная футболка и Голубые джинсы",
            top: ClothingManager.shared.findItem(by: 1) ?? defaultItem(.top),
            bottom: ClothingManager.shared.findItem(by: 3) ?? defaultItem(.bottom)
        ),
        OutfitModel(
            name: "Голубая рубашка и Черная юбка",
            top: ClothingManager.shared.findItem(by: 2) ?? defaultItem(.top),
            bottom: ClothingManager.shared.findItem(by: 4) ?? defaultItem(.bottom)
        )
    ]

    func fetchOutfits() -> [OutfitModel] {
        outfits
    }

    private static func defaultItem(_ type: ItemType) -> ItemModel {
        ItemModel(id: 0, name: "Неизвестно", image: "placeholder", type: type)
    }
}

