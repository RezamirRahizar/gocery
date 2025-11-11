//
//  UserDetailCellView.swift
//  gocery
//
//  Created by Rezamir Rahizar on 11/11/2025.
//

import UIKit
import SnapKit

class UserDetailCellView: UITableViewCell {
    public static let identifier: String = "UserDetailCellView"
    public var user: User? = nil {
        didSet {
            userLabel.text = user?.name
        }
    }
    
    private lazy var userLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(userLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        userLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
