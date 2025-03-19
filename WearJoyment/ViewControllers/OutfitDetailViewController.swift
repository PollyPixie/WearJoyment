//
//  OutfitDetailViewController.swift
//  WearJoyment
//
//  Created by Полина Соколова on 19.03.25.
//

import UIKit

final class OutfitDetailViewController: UIViewController {
    
    private let customRootView = OutfitDetailRootView()
    private let outfit: OutfitModel

    // MARK: - Init
    init(outfit: OutfitModel) {
        self.outfit = outfit
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
        customRootView.configure(with: outfit)
    }
}
