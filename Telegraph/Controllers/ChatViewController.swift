//
//  ChatViewController.swift
//  Telegraph
//
//  Created by Daniil Kulikovskiy on 30.05.2023.
//

import UIKit

class ChatViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ChatTableViewCell.self,
                           forCellReuseIdentifier: ChatTableViewCell.identifier)
        return tableView
    }()
    
    private let textFieldMessage: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Write a message..."
        text.backgroundColor = .white
        text.layer.cornerRadius = 5
        text.font = .systemFont(ofSize: 14)
        text.indent(size: 10)
        return text
    }()
    
    private let buttonPush: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BrandPurple")
        layout()
    }
    
    private func layout() {
        view.addSubview(tableView)
        view.addSubview(textFieldMessage)
        view.addSubview(buttonPush)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
            
            textFieldMessage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            textFieldMessage.heightAnchor.constraint(equalToConstant: 40),
            textFieldMessage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textFieldMessage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            
            buttonPush.heightAnchor.constraint(equalToConstant: 40),
            buttonPush.widthAnchor.constraint(equalToConstant: 40),
            buttonPush.leadingAnchor.constraint(equalTo: textFieldMessage.trailingAnchor, constant: 16),
            buttonPush.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            
        ])
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath)
                as? ChatTableViewCell else {
            fatalError()
        }
        return cell
    }
    
    
    
}
