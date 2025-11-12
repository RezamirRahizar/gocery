//
//  UserListViewController.swift
//  gocery
//
//  Created by Rezamir Rahizar on 11/11/2025.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class UserListViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private let viewModel: UserListViewModel
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Users"
        label.font = .systemFont(ofSize: 24)
        
        return label
    }()
    
    private lazy var userTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UserDetailCellView.self, forCellReuseIdentifier: UserDetailCellView.identifier)
        
        return tableView
    }()
    
    init(viewModel: UserListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        layoutViews()
        bindViewModel()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.loadUsers()
    }
    
    private func bindViewModel() {
        //Bind table to userList in viewModel
        viewModel.users
            .bind(to: userTableView.rx.items(cellIdentifier: UserDetailCellView.identifier, cellType: UserDetailCellView.self)){ row, item, cell in
            cell.setData(item)
        }.disposed(by: disposeBag)
        
        userTableView.rx.modelSelected(User.self).bind { [weak self] user in
            guard let self else { return }
            if let selectedIndexPath = userTableView.indexPathForSelectedRow {
                userTableView.deselectRow(at: selectedIndexPath, animated: true)
            }
            
            //TODO: Navigate to user detail page/popup
        }.disposed(by: disposeBag)
        
    }
    
    private func setupViews() {
        [headerLabel, userTableView].forEach { view in
            self.view.addSubview(view)
        }
    }
    
    private func layoutViews() {
        headerLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview().inset(16)
        }
        
        userTableView.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(16)
            make.bottom.horizontalEdges.equalToSuperview().inset(16)
        }
    }
}
