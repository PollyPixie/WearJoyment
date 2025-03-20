//
//  ClothingViewController.swift
//  WearJoyment
//
//  Created by Полина Соколова on 18.03.25.
//

import UIKit

final class ClothingViewController: UIViewController {
    
    private let customRootView = ClothingRootView()
    private let dataManager: IClothingManager
    
    // MARK: - Init
    init(dataManager: IClothingManager) {
        self.dataManager = dataManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func loadView() {
        view = customRootView
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            let topItems = dataManager.getTops()
            let bottomItems = dataManager.getBottoms()
            customRootView.configure(topItems: topItems, bottomItems: bottomItems)
        }
    }

