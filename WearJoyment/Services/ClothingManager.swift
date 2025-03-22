//
//  ClothingManager.swift
//  WearJoyment
//
//  Created by Полина Соколова on 17.03.25.
//
 
import UIKit

protocol IClothingManager {
    func getTops() -> [ItemModel]
    func getBottoms() -> [ItemModel]
    func findItem(by id: Int) -> ItemModel?
}

final class ClothingManager: IClothingManager {
    static let shared = ClothingManager()
    
    private let items: [ItemModel] = [
        ItemModel(id: 1, name: "Черная юбка", image: "bottomBlackSkirt", type: .bottom),
        ItemModel(id: 2, name: "Бежевая юбка", image: "bottomBeigeSkirt", type: .bottom),
        ItemModel(id: 3, name: "Голубые шорты", image: "bottomLightBlueDenimShorts", type: .bottom),
        ItemModel(id: 4, name: "Голубые джинсы", image: "bottomBlueJeans", type: .bottom)
    ]
    
    func getTops() -> [ItemModel] {
        items.filter { $0.type == .top }
    }
    
    func getBottoms() -> [ItemModel] {
        items.filter { $0.type == .bottom }
    }
    
    func findItem(by id: Int) -> ItemModel? {
        items.first { $0.id == id }
    }
}
