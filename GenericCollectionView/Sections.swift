//
//  Sections.swift
//  GenericCollectionView
//
//  Created by ooba on 27/06/2017.
//  Copyright © 2017 mercari. All rights reserved.
//

import UIKit

struct StringSection: GenericCollectionViewSection {
    var objects: [String]
    
    static func registerCells(collectionView: UICollectionView) {
        collectionView.register(LabelCell.self, forCellWithReuseIdentifier: "StringCell")
    }
    
    func cell(collectionView: UICollectionView, indexPath: IndexPath, object: String) -> UICollectionViewCell? {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StringCell", for: indexPath) as? LabelCell
        cell?.titleLabel.text = object
        cell?.backgroundColor = UIColor.red
        return cell
    }
    
    func size(collectionView: UICollectionView, indexPath: IndexPath, object: String) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

struct IntSection: GenericCollectionViewSection {
    var objects: [Int]
    
    static func registerCells(collectionView: UICollectionView) {
        collectionView.register(LabelCell.self, forCellWithReuseIdentifier: "IntCell")
    }
    
    func cell(collectionView: UICollectionView, indexPath: IndexPath, object: Int) -> UICollectionViewCell? {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntCell", for: indexPath) as? LabelCell
        cell?.titleLabel.text = "Int: \(object)"
        cell?.backgroundColor = UIColor.blue
        return cell
    }
    
    func size(collectionView: UICollectionView, indexPath: IndexPath, object: Int) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}

struct SeparatorSection: GenericCollectionViewSection {
    var objects: [Void] = [()]
    
    static func registerCells(collectionView: UICollectionView) {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "SeparatorCell")
    }
    
    func cell(collectionView: UICollectionView, indexPath: IndexPath, object: Void) -> UICollectionViewCell? {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeparatorCell", for: indexPath)
        cell.backgroundColor = UIColor.gray
        return cell
    }
    
    func size(collectionView: UICollectionView, indexPath: IndexPath, object: Void) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 10)
    }
}

struct UserSection: GenericCollectionViewSection {
    var objects: [User]
    var didSelectBlock: (User) -> Void
    
    static func registerCells(collectionView: UICollectionView) {
        collectionView.register(LabelCell.self, forCellWithReuseIdentifier: "UserCell")
    }
    
    func cell(collectionView: UICollectionView, indexPath: IndexPath, object: User) -> UICollectionViewCell? {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as? LabelCell
        cell?.titleLabel.text = "\(object.id): \(object.name)"
        cell?.backgroundColor = UIColor.green
        return cell
    }
    
    func size(collectionView: UICollectionView, indexPath: IndexPath, object: User) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 50)
    }
    
    func didSelect(collectionView: UICollectionView, indexPath: IndexPath, object: User) {
        didSelectBlock(object)
    }
}
