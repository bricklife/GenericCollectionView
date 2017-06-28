//
//  LabelCell.swift
//  GenericCollectionView
//
//  Created by ooba on 27/06/2017.
//  Copyright © 2017 mercari. All rights reserved.
//

import UIKit

class LabelCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        setupCell()
    }
    
    func setupCell() {
        
        clipsToBounds = true
        
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    // MARK: - Properties
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
}
