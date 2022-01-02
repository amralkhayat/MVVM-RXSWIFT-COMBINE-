//
//  NetworkRequest.swift
//  MVVM
//
//  Created by Amr Saeed on 02/01/2022.
//

import Foundation
import UIKit

struct NetworkLayer {
    
    
    func getPosts(completion: @escaping (Result<[Post], Error>) -> Void) {
       
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, _ , error in
            
            do {
                let respones = try JSONDecoder().decode([Post].self, from: data ?? Data())
                completion(.success(respones))
                
            } catch let error {
                completion(.failure(error))
            }
           
            
        }
        
        dataTask.resume()
    }
    
}
