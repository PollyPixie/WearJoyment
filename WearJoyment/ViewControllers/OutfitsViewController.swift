//
//  OutfitsViewController.swift
//  WearJoyment
//
//  Created by Полина Соколова on 19.03.25.
//

import UIKit

final class OutfitsViewController: UIViewController {
    
    private let customRootView = OutfitsRootView()
    private let dataManager: IOutfitManager
    private var outfits: [OutfitModel] = []
    
    // MARK: - Init
    init(dataManager: IOutfitManager) {
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
        
        outfits = dataManager.fetchOutfits()
        customRootView.outfits = outfits
        
        customRootView.didSelectOutfit = { [weak self] outfit in
            self?.presentDetailVC(for: outfit)
        }
    }
    
    // MARK: - Present DetailVC
    private func presentDetailVC(for outfit: OutfitModel) {
        let detailVC = OutfitDetailViewController(outfit: outfit)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}


