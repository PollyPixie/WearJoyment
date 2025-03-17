//
//  ItemModel.swift
//  WearJoyment
//
//  Created by Полина Соколова on 17.03.25.
//

import UIKit

struct ItemModel {
    let id: Int
    let name: String
    let image: String
    let type: ItemType
}

struct OutfitModel {
    let name: String
    let top: ItemModel
    let bottom: ItemModel
}

enum ItemType: String {
    case top = "Верх"
    case bottom = "Низ"
}

