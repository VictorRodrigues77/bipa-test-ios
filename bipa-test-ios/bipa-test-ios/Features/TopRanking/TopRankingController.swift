//
//  TopRankingController.swift
//  bipa-test-ios
//
//  Created by Victor Rodrigues on 22/06/24.
//

import UIKit

final class TopRankingController: BaseController {
    
    private lazy var refresh: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reloadNodes(_:)), for: .valueChanged)
        return refreshControl
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 270
        table.allowsSelection = false
        return table
    }()
    
    private var coordinator: Coordinator?
    private var viewModel: TopRankingViewModel

    init(coordinator: Coordinator, viewModel: TopRankingViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchNodes()
    }
    
    override func initView() {
        super.initView()
        
        title = "Top Ranking Nodes"
        initTableView()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel.onShowLoading = { [weak self] () in
            self?.showLoading()
        }
        
        viewModel.onHideLoading = { [weak self] () in
            self?.hideLoading()
        }
        
        viewModel.onSuccessFetchNodes = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.onFailureFetchNodes = { [weak self] error in
            self?.showError(error.localizedDescription)
        }
    }
    
}

extension TopRankingController: UITableViewDelegate {}

extension TopRankingController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopRankingCell", for: indexPath) as! TopRankingCell
        guard let node = viewModel.cellForRowAt(at: indexPath.row) else { return UITableViewCell() }
        cell.didDisplay(node: node)
        return cell
    }
}

extension TopRankingController {
    private func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TopRankingCell.self, forCellReuseIdentifier: "TopRankingCell")
        tableView.refreshControl = refresh
        self.view = tableView
    }
    
    @objc func reloadNodes(_ refreshControl: UIRefreshControl) {
        refreshControl.endRefreshing()
        tableView.scrollToRow(at: .init(row: 0, section: 0), at: .top, animated: true)
        viewModel.fetchNodes()
    }
}
