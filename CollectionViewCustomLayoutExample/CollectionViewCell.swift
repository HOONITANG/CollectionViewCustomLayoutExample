//
//  CollectionViewCell.swift
//  CollectionViewCustomLayoutExample
//
//  Created by Taehoon Kim on 2022/03/02.
//


import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var title:String? {
        didSet {
            configureUI()
        }
    }

    private var heightLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heightLabel)
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        heightLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        guard let title = title else {
            return
        }
        
        heightLabel.text = title
    }
    
}
