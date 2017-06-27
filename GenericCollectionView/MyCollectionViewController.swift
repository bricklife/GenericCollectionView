//
//  MyCollectionViewController.swift
//  GenericCollectionView
//
//  Created by ooba on 27/06/2017.
//  Copyright © 2017 mercari. All rights reserved.
//

import UIKit

class MyCollectionViewController: CollectionViewDataController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(sections: [
            StringSection.self,
            IntSection.self,
            UserSection.self,
            SeparatorSection.self,
            ])
        
        let viewModel = CollectionViewDataController.ViewModel()
        
        viewModel.content = [
            StringSection(objects: ["a", "b", "c", "d", "e", "f", "g"]),
            
            SeparatorSection(),
            
            IntSection(objects: Array(1...20)),
            
            SeparatorSection(),
            
            UserSection(objects: [User(id: 1, name: "One"), User(id: 2, name: "Two")], didSelectBlock: { [weak self] user in
                let alert = UIAlertController(title: "User", message: "\(user)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self?.present(alert, animated: true, completion: nil)
            }),
        ]
        
        self.viewModel = viewModel
    }
}
