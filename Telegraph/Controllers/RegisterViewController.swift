//
//  RegisterViewController.swift
//  Telegraph
//
//  Created by Daniil Kulikovskiy on 30.05.2023.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    private let emailTextField: UITextField = {
        let mail = UITextField()
        mail.translatesAutoresizingMaskIntoConstraints = false
        mail.backgroundColor = .white
        mail.placeholder = "Email"
        mail.textAlignment = .center
        mail.font = .systemFont(ofSize: 25)
        mail.layer.cornerRadius = 30
        mail.layer.shadowOffset = CGSize(width: 0, height: 3)
        mail.layer.shadowOpacity = 0.2
        mail.layer.shadowRadius = 30
        mail.layer.cornerRadius = 30
        return mail
    }()
    
    private let passwordTextField: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.placeholder = "Password"
        password.backgroundColor = .white
        password.textAlignment = .center
        password.font = .systemFont(ofSize: 25)
        password.layer.shadowOffset = CGSize(width: 0, height: 10)
        password.layer.shadowOpacity = 0.2
        password.layer.shadowRadius = 30
        password.layer.cornerRadius = 30
        return password
    }()
    
    private lazy var registerButton: UIButton = {
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
//        button.addTarget(self, action: #selector(auntificationPressed), for: .touchUpInside)
        return button
    }()
    
//    @objc func auntificationPressed() {
//        let email = emailButton.text
//        handle = Auth.auth().addStateDidChangeListener { auth, user in
//          // ...
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BrandLightBlue")
        setNavigationController()
        layout()
    }
    
    func setNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.tintColor = UIColor(named: "BrandBlue")
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "BrandBlue")!]
        navigationItem.title = "Register"
    }
    
    func layout() {
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            emailTextField.heightAnchor.constraint(equalToConstant: 60),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            passwordTextField.heightAnchor.constraint(equalToConstant: 60),
            
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            registerButton.heightAnchor.constraint(equalToConstant: 60),
            
        ])
    }
    
}
