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
    private var tempUsers: [User] = [
        User(id: UUID(), name: "John", email: nil),
        User(id: UUID(), name: "Abdul", email: "abdul@email.com"),
        User(id: UUID(), name: "Ching", email: "cing@hotmail.com"),
    ]
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Users"
        label.font = .systemFont(ofSize: 24)
        
        return label
    }()
    
    private lazy var userTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
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
        
    }
    
    private func bindViewModel() {
//        userTableView
//        tempUsers = viewModel.getUsers(from: 1)
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

extension UserListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //handle navigation to UserDetailViewController
        guard let cell = userTableView.cellForRow(at: indexPath) as? UserDetailCellView else { return }
    }
}

extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.rxUsers.value.count
        return tempUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = userTableView.cellForRow(at: indexPath) as? UserDetailCellView else {
//            return UITableViewCell()
//        }
        guard let cell = userTableView.dequeueReusableCell(withIdentifier: UserDetailCellView.identifier, for: indexPath) as? UserDetailCellView else {
            return UITableViewCell()
        }
        
        cell.user = tempUsers[indexPath.row]
        
        return cell
    }
}
