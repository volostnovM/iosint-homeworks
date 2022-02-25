//
//  PhotosTableViewCell.swift
//  Navigation
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private let photosCollectionID = String(describing: PhotosCollectionViewCell.self)
    private let photoProcessing = PhotoProcessing()
    
    private var baseInset: CGFloat { return 12 }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private let photoWidth = (UIScreen.main.bounds.width - 12 - 12 - 8 - 8 - 8)/4
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var jumpImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "strelka")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true

        imageView.layer.cornerRadius = 6
        return imageView
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
}

extension PhotosTableViewCell {
    func setupViews(){
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(jumpImageView)
        contentView.addSubview(collectionView)
        
        photoProcessing.processing(completion: {
            self.collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: self.photosCollectionID)
            self.collectionView.dataSource = self
            self.collectionView.delegate = self
            self.collectionView.backgroundColor = .white
        })
        
        let constraints = [
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            
            jumpImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            jumpImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            jumpImageView.widthAnchor.constraint(equalToConstant: 30),
            jumpImageView.heightAnchor.constraint(equalToConstant: 30),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: baseInset),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoProcessing.processedPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PhotosCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: photosCollectionID, for: indexPath) as! PhotosCollectionViewCell
           cell.deviceImageView.image = photoProcessing.processedPhotos[indexPath.item]
           cell.deviceImageView.layer.cornerRadius = 6
           return cell
    }
}

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt IndexPath: IndexPath) -> CGSize {
        let width: CGFloat
        let height: CGFloat
        width = (collectionView.frame.width - baseInset * 2 - 8 * 3)/4
        height = collectionView.frame.height - baseInset * 2
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: baseInset, bottom: baseInset, right: baseInset)
    }
}
