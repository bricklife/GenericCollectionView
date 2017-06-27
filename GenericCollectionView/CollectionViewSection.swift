//
//  CollectionViewSection.swift
//  GenericCollectionView
//
//  Created by ooba on 27/06/2017.
//  Copyright © 2017 mercari. All rights reserved.
//

import UIKit

protocol CollectionViewSection {
    
    static func registerCells(collectionView: UICollectionView)
    
    func numberOfItems() -> Int
    func cell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
    func size(collectionView: UICollectionView, indexPath: IndexPath) -> CGSize
    
    func didSelect(collectionView: UICollectionView, indexPath: IndexPath)
}

extension CollectionViewSection {
    
    func didSelect(collectionView: UICollectionView, indexPath: IndexPath) {
        // default: do nothing
    }
}

extension UICollectionView {
    
    func register(sections: [CollectionViewSection.Type]) {
        sections.forEach { $0.registerCells(collectionView: self) }
    }
}


protocol GenericCollectionViewSection: CollectionViewSection {
    associatedtype Object
    
    var objects: [Object] { set get }
    
    func cell(collectionView: UICollectionView, indexPath: IndexPath, object: Object) -> UICollectionViewCell?
    func size(collectionView: UICollectionView, indexPath: IndexPath, object: Object) -> CGSize
    
    func didSelect(collectionView: UICollectionView, indexPath: IndexPath, object: Object)
}

extension GenericCollectionViewSection {
    
    func numberOfItems() -> Int {
        return objects.count
    }
    
    func cell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let object = objects[indexPath.row]
        return cell(collectionView: collectionView, indexPath: indexPath, object: object) ?? UICollectionViewCell()
    }
    
    func size(collectionView: UICollectionView, indexPath: IndexPath) -> CGSize {
        let object = objects[indexPath.row]
        return size(collectionView: collectionView, indexPath: indexPath, object: object)
    }
    
    func didSelect(collectionView: UICollectionView, indexPath: IndexPath) {
        let object = objects[indexPath.row]
        didSelect(collectionView: collectionView, indexPath: indexPath, object: object)
    }
}

extension GenericCollectionViewSection {
    
    func didSelect(collectionView: UICollectionView, indexPath: IndexPath, object: Object) {
        // default: do nothing
    }
}
