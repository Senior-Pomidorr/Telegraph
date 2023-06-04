//
//  LoginViewController.swift
//  Telegraph
//
//  Created by Daniil Kulikovskiy on 30.05.2023.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    private let emailLogin: UITextField = {
        let mailText = UITextField()
        mailText.translatesAutoresizingMaskIntoConstraints = false
        mailText.placeholder = "Email"
        mailText.backgroundColor = .white
        mailText.textAlignment = .center
        mailText.text = "1@2.com"
        mailText.font = .systemFont(ofSize: 25)
        mailText.layer.shadowOffset = CGSize(width: 0, height: 3)
        mailText.layer.shadowOpacity = 0.2
        mailText.layer.shadowRadius = 30
        mailText.layer.cornerRadius = 30
        return mailText
    }()
    
    private let passwordLogin: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.placeholder = "Password"
        password.font = .systemFont(ofSize: 25)
        password.backgroundColor = .white
        password.textAlignment = .center
        password.isSecureTextEntry = true
        password.text = "123456"
        password.layer.shadowOffset = CGSize(width: 0, height: 10)
        password.layer.shadowOpacity = 0.2
        password.layer.shadowRadius = 30
        password.layer.cornerRadius = 30
        return password
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.backgroundColor = UIColor(named: "Login")
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowOffset = CGSize(width: 0, height: 10)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 30
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(pressLogin), for: .touchUpInside)
        return button
    }()
    
    @objc func pressLogin() {
        if let email = emailLogin.text, let password = passwordLogin.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let chechError = error {
                    print(chechError.localizedDescription)
                } else {
                    let chatVC = ChatViewController()
                    self.navigationController?.pushViewController(chatVC, animated: true)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "LoginBackground")
        setNavigationController()
        layout()
        
    }
    
    func setNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "Log In"
    }
    
    func layout() {
        
        view.addSubview(emailLogin)
        view.addSubview(passwordLogin)
        view.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            
            emailLogin.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            emailLogin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            emailLogin.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            emailLogin.heightAnchor.constraint(equalToConstant: 60),
            
            passwordLogin.topAnchor.constraint(equalTo: emailLogin.bottomAnchor, constant: 16),
            passwordLogin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            passwordLogin.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            passwordLogin.heightAnchor.constraint(equalToConstant: 60),
            
            registerButton.topAnchor.constraint(equalTo: passwordLogin.bottomAnchor, constant: 16),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            registerButton.heightAnchor.constraint(equalToConstant: 60),
            
        ])
    }
}




