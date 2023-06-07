//
//  ChatViewController.swift
//  Telegraph
//
//  Created by Daniil Kulikovskiy on 30.05.2023.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    var messages: [Message] = []
    
    let db = Firestore.firestore()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "ReusebleCell")
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
    
    private lazy var buttonPush: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        return button
    }()
    
    @objc func sendMessage() {
        if let messageBody = textFieldMessage.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.collectionName).addDocument(data: [
                K.senderField: messageSender,
                K.bodyField: messageBody,
                K.dataField: Date().timeIntervalSince1970
            ]) { (error) in
                if let checkEroor = error {
                    print(checkEroor.localizedDescription)
                } else {
                    print("Seccessfully save data")
                    DispatchQueue.main.async {
                        self.textFieldMessage.text = ""
                    }
                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Telegraph"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        view.backgroundColor = UIColor(named: "BrandBlue")
        let logOut = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logOut))
            navigationItem.rightBarButtonItem = logOut
        navigationController?.navigationBar.prefersLargeTitles = false
        
        navigationItem.hidesBackButton = true
        loadMessages()
        layout()
    }
    
    func loadMessages() {
        
        db.collection(K.collectionName).order(by: K.dataField).addSnapshotListener { (querySnapshot, error) in
            self.messages = []
            if let checkErorr = error {
                print(checkErorr.localizedDescription)
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageSender = data[K.senderField] as? String, let messageBody = data[K.bodyField] as? String {
                            let newMassage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMassage)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                let indexPath = IndexPath(row: self.messages.count - 1 , section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @objc func logOut() {
        do {
          try Auth.auth().signOut()
            print("logout")
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
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

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReusebleCell", for: indexPath)
                as? CustomTableViewCell else {
            fatalError()
        }
        cell.label.text = message.body
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
        } else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: "BackgroundColor")
        }
        return cell
    }
}


    

