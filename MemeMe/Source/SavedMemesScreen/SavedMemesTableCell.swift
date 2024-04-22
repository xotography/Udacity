//
//  SavedMemesTableCell.swift
//  Meme
//
//  Created by Ariya Behjat on 22/02/2020.
//  Copyright © 2020 Ariya Behjat. All rights reserved.
//

import UIKit

final class SavedMemesTableCell: UITableViewCell {
    static let identifier = "SavedMemesTableCell"
    
    let stackView = UIStackView()
    let memeImageView = UIImageView(image: UIImage(named: "placeholder"))
    let memeName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpSubviews()
    }
    
    func setUpSubviews() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(memeImageView)
        stackView.addArrangedSubview(memeName)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            memeImageView.heightAnchor.constraint(equalToConstant: 140)
        ])
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 8
        memeName.font = UIFont.systemFont(ofSize: 20)
        memeName.numberOfLines = 1
        memeImageView.contentMode = .scaleAspectFill
        memeImageView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
