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
        title = "Гардероб" // Название экрана
        
        let allItems = dataManager.getTops() + dataManager.getBottoms() 
            customRootView.configure(items: allItems)
    }

    //override func viewWillAppear(_ animated: Bool) { //для таб бара
        //super.viewWillAppear(animated)
        //navigationController?.navigationBar.prefersLargeTitles = true}
}

