//
//  RegisterViewController.swift
//  Telegraph
//
//  Created by Daniil Kulikovskiy on 30.05.2023.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    private let emailButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Email", for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.setTitleColor(.systemGray3, for: .normal)
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 30
        button.layer.cornerRadius = 30
        return button
    }()
    
    private let passwordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Password", for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.setTitleColor(.systemGray3, for: .normal)
        button.layer.shadowOffset = CGSize(width: 0, height: 10)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 30
        button.layer.cornerRadius = 30
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.backgroundColor = .systemCyan
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowOffset = CGSize(width: 0, height: 10)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 30
        button.layer.cornerRadius = 30
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BrandLightBlue")
        layout()
        
    }
    
    func layout() {
        
        view.addSubview(emailButton)
        view.addSubview(passwordButton)
        view.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            
            emailButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            emailButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            emailButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            emailButton.heightAnchor.constraint(equalToConstant: 60),
            
            passwordButton.topAnchor.constraint(equalTo: emailButton.bottomAnchor, constant: 16),
            passwordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            passwordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            passwordButton.heightAnchor.constraint(equalToConstant: 60),
        
            registerButton.topAnchor.constraint(equalTo: passwordButton.bottomAnchor, constant: 16),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            registerButton.heightAnchor.constraint(equalToConstant: 60),
            
        
        ])
        
    }
    
}
