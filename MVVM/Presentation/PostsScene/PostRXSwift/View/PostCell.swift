//
//  PostRXSWIFTTableViewCell.swift
//  MVVM
//
//  Created by Amr Saeed on 28/12/2021.
//

import UIKit

class PostCell: UITableViewCell {
    //MARK: - Properties
    private let title: UILabel = {
     let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let body: UILabel = {
     let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        CellConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    //MARK: - Helpers
    private func CellConstraints() {
      let stack = UIStackView(arrangedSubviews: [title,body])
        stack.axis = .vertical
        stack.spacing = 3
        stack.alignment = .fill
        addSubview(stack)
        stack.anchor(top: safeAreaLayoutGuide.topAnchor, left:  safeAreaLayoutGuide.leftAnchor,
                     bottom:  safeAreaLayoutGuide.bottomAnchor,
                     right:  safeAreaLayoutGuide.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5)
    }
    
    func configuration (_ viewModel: Post) {
        self.title.text = viewModel.title
        self.body.text = viewModel.body
    }
    
}
