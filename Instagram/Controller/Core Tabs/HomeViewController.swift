//
//  ViewController.swift
//  Instagram
//
//  Created by Nurmukhanbet Sertay on 11.05.2023.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        handleNotAuthenticated()
        print(Auth.auth().currentUser ?? "Eshkim zhok")
    }
    
    private func handleNotAuthenticated() {
        if Auth.auth().currentUser == nil {
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    } 
}

