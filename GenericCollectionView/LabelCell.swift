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
        
        var viewConstraints = [NSLayoutConstraint]()
        viewConstraints.append(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 0.0))
        viewConstraints.append(NSLayoutConstraint(item: titleLabel, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1.0, constant: 0.0))
        viewConstraints.append(NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 0.0))
        viewConstraints.append(NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1.0, constant: 0.0))
        
        contentView.addConstraints(viewConstraints)
    }
    
    // MARK: - Properties
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
}
