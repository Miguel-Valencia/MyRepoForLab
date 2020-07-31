//
//  RepoViewController.swift
//  MyRepoForLab
//
//  Created by Miguel Angel Valencia Colina on 7/31/20.
//

import UIKit

class RepoViewController: UIViewController {
    
    private let closeButton: UIButton
    private let doneButton: UIButton
    private let stackView: UIStackView
    private let titleText: String
    private let subtitleText: String
    private let image: UIImage?
    
    init(titleText: String, subtitleText: String, image: UIImage?) {
        self.closeButton = UIButton()
        self.doneButton = UIButton()
        self.stackView = UIStackView()
        self.titleText = titleText
        self.subtitleText = subtitleText
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Error Message")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupStackView()
        self.setupButtons()
        self.setupFirstView()
        self.setupSecondView()
    }
    
    private func setupButtons() {
        self.doneButton.setTitle("Entendido", for: .normal)
        self.doneButton.titleLabel?.textColor = .white
        self.doneButton.backgroundColor = .blue
        self.doneButton.addTarget(self, action: #selector(self.dismissView), for: .touchUpInside)
        
        self.closeButton.setImage(UIImage(named: "Resources.bundle/black-close", in: Bundle(for: RepoViewController.self), compatibleWith: nil), for: .normal)
        self.closeButton.imageView?.contentMode = .scaleAspectFit
        self.closeButton.translatesAutoresizingMaskIntoConstraints = false
        self.closeButton.addTarget(self, action: #selector(self.dismissView), for: .touchUpInside)
        self.view.addSubview(self.closeButton)
        
        NSLayoutConstraint.activate([
            self.closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8.0),
            self.closeButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8.0),
            self.closeButton.heightAnchor.constraint(equalToConstant: 30.0),
            self.closeButton.widthAnchor.constraint(equalToConstant: 30.0)
        ])
    }
    
    private func setupStackView() {
        self.view.addSubview(self.stackView)
        self.stackView.axis = .vertical
        self.stackView.alignment = .fill
        self.stackView.distribution = .fill
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.stackView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor),
            self.stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupFirstView() {
        let firstViewInStack: UIView = UIView()
        firstViewInStack.backgroundColor = .white
        self.stackView.addArrangedSubview(firstViewInStack)
        firstViewInStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstViewInStack.heightAnchor.constraint(equalTo: self.stackView.heightAnchor, multiplier: 0.2),
            firstViewInStack.widthAnchor.constraint(equalTo: self.stackView.widthAnchor)
        ])
    }
    
    private func setupSecondView() {
        let imageView: UIImageView = UIImageView(image: UIImage(named: "Resources.bundle/image-placeholder", in: Bundle(for: RepoViewController.self), compatibleWith: nil))
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel: UILabel = UILabel()
        titleLabel.text = self.titleText
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let subtitleLabel: UILabel = UILabel()
        subtitleLabel.text = self.subtitleText
        subtitleLabel.textColor = .black
        subtitleLabel.font.withSize(16.0)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let secondViewInStack: UIView = UIView()
        secondViewInStack.backgroundColor = .white
        secondViewInStack.addSubview(imageView)
        secondViewInStack.addSubview(titleLabel)
        secondViewInStack.addSubview(subtitleLabel)
        secondViewInStack.addSubview(doneButton)
        self.stackView.addArrangedSubview(secondViewInStack)
        secondViewInStack.translatesAutoresizingMaskIntoConstraints = false
        self.doneButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondViewInStack.widthAnchor.constraint(equalTo: self.stackView.widthAnchor),
            imageView.topAnchor.constraint(equalTo: secondViewInStack.topAnchor, constant: 8.0),
            imageView.widthAnchor.constraint(equalToConstant: 120.0),
            imageView.heightAnchor.constraint(equalToConstant: 120.0),
            imageView.centerXAnchor.constraint(equalTo: secondViewInStack.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40.0),
            titleLabel.centerXAnchor.constraint(equalTo: secondViewInStack.centerXAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.0),
            subtitleLabel.centerXAnchor.constraint(equalTo: secondViewInStack.centerXAnchor),
            self.doneButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20),
            self.doneButton.heightAnchor.constraint(equalToConstant: 44.0),
            self.doneButton.leadingAnchor.constraint(equalTo: secondViewInStack.leadingAnchor),
            self.doneButton.trailingAnchor.constraint(equalTo: secondViewInStack.trailingAnchor),
        ])
    }
    
    @objc private func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
}
