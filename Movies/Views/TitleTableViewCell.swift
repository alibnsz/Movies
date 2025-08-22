//
//  TitleTableViewCell.swift
//  Movies
//
//  Created by Mehmet Ali Bunsuz on 22.08.2025.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    static let identifier = "TitleTableViewCell"
    
    private let playTitleButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.tintColor = .white
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titlePosterUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlePosterUIImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitleButton)
        applyConstraints()
    }
    
    private func applyConstraints() {
        let titlePosterUIImageViewConstraints: [NSLayoutConstraint] = [
            titlePosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlePosterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            titlePosterUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            titlePosterUIImageView.widthAnchor.constraint(equalToConstant: 100),

            ]
        
        let titleLabelConstraint = [
            titleLabel.leadingAnchor.constraint(equalTo: titlePosterUIImageView.trailingAnchor, constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: titlePosterUIImageView.centerYAnchor),
        ]
        
        let playTitleButtonConstraint = [
            playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(titlePosterUIImageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraint)
        NSLayoutConstraint.activate(playTitleButtonConstraint)
    }
    
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
    
        titlePosterUIImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
        
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
