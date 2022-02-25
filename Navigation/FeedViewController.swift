//
//  ViewController.swift
//  Navigation
//

import UIKit
import StorageService

final class FeedViewController: UIViewController {
    
    private let checkEnteredWord: CheckEnteredWord?
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var buttonCheck: CustomButton = {
        let button = CustomButton(title: "Check the entered word", titleColor: .white, backgroundColor: nil, backgroundImage: UIImage(imageLiteralResourceName: "pixel"), buttonAction: { [weak self] in
            self?.label.isHidden = false
            self?.checkEnteredWord?.checkWord(enteredWord: self?.textField.text, onChecked: { correct in
                if (correct) {
                    self?.label.text = "True"
                    self?.label.textColor = .green
                } else {
                    self?.label.text = "False"
                    self?.label.textColor = .systemRed
                }
            })
        })
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    private lazy var textField: CustomTextField = {
        let textField = CustomTextField(font: .systemFont(ofSize: 16), textColor: .black, backgroundColor: .systemGray6, placeholder: "Please enter text")
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()

    private lazy var label : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init() {
        self.checkEnteredWord = CheckEnteredWord()
        super.init(nibName: nil, bundle: nil)
    }

    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Feed"
        
        setupViews()
        setupConstraints()
    }
}
extension FeedViewController {
    private func setupViews() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(buttonCheck)
    }
}

extension FeedViewController {
    private func setupConstraints() {
        [
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            label.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            textField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.widthAnchor.constraint(equalToConstant: 300),
            
            buttonCheck.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            buttonCheck.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            buttonCheck.heightAnchor.constraint(equalToConstant: 50),
            buttonCheck.widthAnchor.constraint(equalToConstant: 300),
        ]
        .forEach {$0.isActive = true}
    }
}
