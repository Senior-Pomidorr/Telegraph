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
        label.text = "Telegraph"
        label.textColor = .blue
        label.font = .boldSystemFont(ofSize: 50)
        label.textAlignment = .center
        return label
    }()
    
    private let buttonRegister: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.text = "Register"
        return button
    }()
    
    private let buttonLogIn: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.text = "LogIn"
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        layout()

       
    }
    
    func layout() {
        view .addSubview(mainLabel)
        
        NSLayoutConstraint.activate([
            
            mainLabel.widthAnchor.constraint(equalToConstant: 260),
            mainLabel.heightAnchor.constraint(equalToConstant: 80),
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        
        ])
    }
   

}
