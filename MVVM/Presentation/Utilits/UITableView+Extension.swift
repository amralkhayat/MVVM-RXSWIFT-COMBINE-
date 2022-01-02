//
//  UITableView+Extension.swift
//  MVVM
//
//  Created by Amr Saeed on 28/12/2021.
//

import UIKit
extension UITableViewCell {
    
    class var identifier: String {
        return String(describing: self)
    }
    
}

extension UITableView {
 
    func registerCellNib<Cell: UITableViewCell>(cellClass: Cell.Type){
       register(cellClass, forCellReuseIdentifier: cellClass.identifier)
    }
    
    func dequeue<Cell: UITableViewCell>() -> Cell{

        guard let cell = self.dequeueReusableCell(withIdentifier: Cell.identifier) as? Cell else {
            fatalError("Error in cell")
        }
        
        return cell
    }
    
}
