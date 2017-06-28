//
//  CollectionViewDataController.swift
//  GenericCollectionView
//
//  Created by ooba on 27/06/2017.
//  Copyright © 2017 mercari. All rights reserved.
//

import UIKit

class CollectionViewDataController: UIViewController {
    
    class ViewModel {
        
        var content: [CollectionViewSection] = []
    }
    
    var viewModel: ViewModel?
    
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.minimumLineSpacing = 0.0
        flowLayout.sectionInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        flowLayout.headerReferenceSize = .zero
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

extension CollectionViewDataController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel?.content.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.content[section].numberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return viewModel?.content[indexPath.section].cell(collectionView: collectionView, indexPath: indexPath) ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        return viewModel?.content[indexPath.section].size(collectionView: collectionView, indexPath: indexPath) ?? CGSize.zero
    }
}

extension CollectionViewDataController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.content[indexPath.section].didSelect(collectionView: collectionView, indexPath: indexPath)
    }
}
