//
//  PostObservableViewModel.swift
//  MVVM
//
//  Created by Amr Saeed on 27/12/2021.
//

import Foundation
import RxSwift
import RxCocoa

protocol PostsRXSWIFTViewModelInput {
    func viewDidLoad()
}

protocol PostsRXSWIFTViewModelOutput {
    var numberOfItems: Int { get }
   func postsAtIndexPath(_ indexPath: IndexPath) -> Post
    
}

typealias PostsRXSWIFTViewModel = PostsRXSWIFTViewModelInput & PostsRXSWIFTViewModelOutput

final class PostsRXSWIFTViewModelImplementation: PostsRXSWIFTViewModel {
   
  
    let network = NetworkLayer()
    
 var items: BehaviorRelay<[Post]> = .init(value: [])
    
    
   //MARK: - INPUT

    //MARK: - OUTPUT
    
    
    func viewDidLoad() {
        network.getPosts { [weak self] respones in
            guard let self = self else {return}
            switch respones {
            case let .success(data):
                self.items.accept(data)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    var numberOfItems: Int {
        return items.value.count
    }
    
    func postsAtIndexPath(_ indexPath: IndexPath) -> Post {
        return items.value[indexPath.row]
    }
    
    
}
