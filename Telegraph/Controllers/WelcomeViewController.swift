//
//  WelcomeViewController.swift
//  Telegraph
//
//  Created by Daniil Kulikovskiy on 30.05.2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Telegraph"
        label.textColor = UIColor(named: "BrandBlue")
        label.font = .boldSystemFont(ofSize: 50)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var buttonRegister: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor(named: "BrandBlue"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.backgroundColor = UIColor(named: "BrandLightBlue")
        button.addTarget(self, action: #selector(tapRegister), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonLogIn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.textColor = .black
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.tintColor = .black
        button.backgroundColor = .systemTeal
        button.addTarget(self, action: #selector(tapLogIn), for: .touchUpInside)
        return button
    }()
    
    @objc func tapRegister() {
        let registerVC = RegisterViewController()
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    @objc func tapLogIn() {
        let logVC = LoginViewController()
        self.navigationController?.pushViewController(logVC, animated: true)
        
//        logVC.modalPresentationStyle = .automatic
//        present(logVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        animationMainLabel()
        layout()
    }
    
    func animationMainLabel() {
        mainLabel.text = ""
        var indexForLoop = 0.1
        let titleText = "Telegraph"
        for char in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.110 * indexForLoop, repeats: false) { timer in
                self.mainLabel.text?.append(char)
            }
            indexForLoop += 1
        }
    }
    
    func layout() {
        view.addSubview(mainLabel)
        view.addSubview(buttonRegister)
        view.addSubview(buttonLogIn)
        
        NSLayoutConstraint.activate([
            
            mainLabel.widthAnchor.constraint(equalToConstant: 260),
            mainLabel.heightAnchor.constraint(equalToConstant: 80),
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            buttonLogIn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            buttonLogIn.heightAnchor.constraint(equalToConstant: 60),
            buttonLogIn.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            buttonRegister.bottomAnchor.constraint(equalTo: buttonLogIn.topAnchor, constant: -10),
            buttonRegister.heightAnchor.constraint(equalToConstant: 60),
            buttonRegister.widthAnchor.constraint(equalTo: view.widthAnchor),
            
        ])
    }
    
    
}
