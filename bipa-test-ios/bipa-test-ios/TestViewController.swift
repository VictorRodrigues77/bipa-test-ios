//
//  TestViewController.swift
//  bipa-test-ios
//
//  Created by Victor Rodrigues on 22/06/24.
//

import UIKit

final class TestViewController: UIViewController {
    
    private let service: TopRankingService
    
    init(service: TopRankingService) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task(priority: .background) {
            let result = await service.getListOfNodes()
            print(result)
        }
    }
    
}
