//
//  PhotosCollectionCell.swift
//  VirtualTourist
//
//  Created by Ariya Behjat on 04/04/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

import UIKit

final class PhotosCollectionCell: UICollectionViewCell {
    static let identifier = "PhotosCollectionCell"
    
    let photoImageView = UIImageView()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    override init(frame: CGRect) {
    super.init(frame: frame)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(photoImageView)
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        photoImageView.tintColor = .lightGray
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
