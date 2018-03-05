//
//  LoginViewController.swift
//  testloginfb
//
//  Created by Juan Lopez on 31/12/16.
//  Copyright © 2016 Juan Lopez. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {

    let inputContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255, a: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255, a: 1)
        view.addSubview(inputContainerView)
        setupInputsContainerView()
    }

    func setupInputsContainerView() {
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 24).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputContainerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 250).isActive = true

        let fbButton = FBSDKLoginButton()
        fbButton.frame = CGRect(x: 16, y: 50, width: view.frame.width - 50, height: 50)
        fbButton.delegate = self

        inputContainerView.addSubview(fbButton)

        fbButton.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        fbButton.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        fbButton.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor, constant: -24).isActive = true
        fbButton.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1 / 3).isActive = true
    }

    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        print("Successfully logged in with facebook...")
        let viewController = ViewController()
        present(viewController, animated: true, completion: nil)
    }

    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of facebook")
    }
}


