//
//  PostRXSWIFTTableView.swift
//  MVVM
//
//  Created by Amr Saeed on 28/12/2021.
//

import UIKit
import RxSwift
class PostRXSWIFTTableView: UITableViewController {


    //MARK: - PROPERTIES
    lazy var disposeBag: DisposeBag = {
        return DisposeBag()
    }()
    
   lazy var viewModel: PostsRXSWIFTViewModelImplementation = {
        return PostsRXSWIFTViewModelImplementation()
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bind()
    }

    //MARK: - Helper
    private func configureUI() {
        self.navigationItem.title = "Posts"
        tableView.tableFooterView = UIView()
        tableView.registerCellNib(cellClass: PostCell.self)
        viewModel.viewDidLoad()
    }
    
    
    private func bind() {
        
        viewModel.items.subscribe { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
          
        }.disposed(by: disposeBag)
    }

}

extension  PostRXSWIFTTableView {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as PostCell
        cell.configuration(viewModel.postsAtIndexPath(indexPath))
        return cell
    }
    
    
    
}
