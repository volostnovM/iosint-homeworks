//
//  ProfileTableHederView.swift
//  Navigation
//

import UIKit

class ProfileHederView: UITableViewHeaderFooterView {
    
    private var statusText :String? = nil
    
    var profileHeaderView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(white: 0.95, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
        var fullNameLabel: UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            label.text = "Hipster Cat"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        var statusLabel: UILabel = {
            let label = UILabel()
            label.textColor = .gray
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.text = "Waiting for something..."
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        var avatarImageView: UIImageView = {
            let imageView = UIImageView()

            imageView.isUserInteractionEnabled = true
            imageView.image = UIImage(named: "avatar")
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.layer.borderWidth = 3.0
            imageView.layer.borderColor = UIColor.white.cgColor
            return imageView
        }()
    

        
        var setStatusButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = UIColor.blue
            button.setTitleColor(UIColor.white, for: .normal)
            button.setTitle("Show status", for: .normal)
            button.addTarget(self, action: #selector(pressButtonWriteStatus), for: .touchUpInside)
            button.clipsToBounds = true
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowRadius = 4
            button.layer.shadowOpacity = 0.7
            button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
            button.layer.cornerRadius = 4

            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()


        var statusTextField: UITextField = {
            let textField = UITextField()
            textField.textColor = .black
            textField.backgroundColor = .white
            textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            textField.placeholder = "Write status"
            textField.addTarget(self, action: #selector(textFieldwriteStatus), for: .editingChanged)
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
            textField.leftViewMode = .always
            textField.layer.cornerRadius = 12
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.white.cgColor
            
            return textField
        }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    @objc func pressButtonWriteStatus() {
        if let outputStatus = statusText {
            print(outputStatus)
            statusLabel.text = outputStatus
        }
        else {
            print("Ничего менять!")
        }
    }
    
    @objc func textFieldwriteStatus() {
        statusText = statusTextField.text
        
        if let outputStatus = statusText{
            print(outputStatus)
        }
        else {
            print("Ничего не вводили!")
        }
    }
        
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
    }
}

private extension ProfileHederView{

    func setupViews() {
        
        contentView.addSubview(profileHeaderView)
        profileHeaderView.addSubview(avatarImageView)
        profileHeaderView.addSubview(fullNameLabel)
        profileHeaderView.addSubview(statusLabel)
        profileHeaderView.addSubview(statusTextField)
        profileHeaderView.addSubview(setStatusButton)
                     
        let constraints = [
                  
            profileHeaderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            avatarImageView.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 110),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110),
            
            fullNameLabel.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 27),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 30),
            fullNameLabel.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 132),
            fullNameLabel.widthAnchor.constraint(equalToConstant: 180),
            
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 25),
            statusLabel.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 132),
            statusLabel.rightAnchor.constraint(equalTo: profileHeaderView.rightAnchor, constant: -16),
            statusLabel.heightAnchor.constraint(equalToConstant: 14),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 132),
            statusTextField.rightAnchor.constraint(equalTo: profileHeaderView.rightAnchor, constant: -16),
            
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            setStatusButton.rightAnchor.constraint(equalTo: profileHeaderView.rightAnchor, constant: -16),
            setStatusButton.leftAnchor.constraint(equalTo: profileHeaderView.leftAnchor, constant: 16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
