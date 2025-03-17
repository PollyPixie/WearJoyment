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
        ItemModel(id: 1, name: "Черная футболка", image: "черная футболка", type: .top),
        ItemModel(id: 2, name: "Голубая рубашка", image: "голубая рубашка", type: .top),
        ItemModel(id: 3, name: "Голубые джинсы", image: "голубые джинсы", type: .bottom),
        ItemModel(id: 4, name: "Черная юбка", image: "черная юбка", type: .bottom)
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
