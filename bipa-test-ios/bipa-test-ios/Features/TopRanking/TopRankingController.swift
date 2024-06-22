//
//  TopRankingController.swift
//  bipa-test-ios
//
//  Created by Victor Rodrigues on 22/06/24.
//

import UIKit

final class TopRankingController: UIViewController {
    
    private var coordinator: Coordinator?
    
    var initialView: TopRankingView?
    
    private var viewModel: TopRankingViewModel

    init(coordinator: Coordinator, viewModel: TopRankingViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let initialView = TopRankingView()
        self.initialView = initialView
        self.view = initialView
    }
    
}
