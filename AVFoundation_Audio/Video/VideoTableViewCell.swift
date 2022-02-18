//
//  VideoTableViewCell.swift
//  AVFoundation_Audio
//
//  Created by TIS Developer on 18.02.2022.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    var video: Video? {
        didSet {
            guard let safeVideo = video else { return }
            videoNameLabel.text = safeVideo.name
        }
    }

    private lazy var videoNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = UIColor.white.withAlphaComponent(0.9)
        contentView.addSubview(videoNameLabel)
    }
    
    private func setupLayouts() {
        let constraints = [
            videoNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            videoNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            videoNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            videoNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ]
        NSLayoutConstraint.activate(constraints)
    }

}
