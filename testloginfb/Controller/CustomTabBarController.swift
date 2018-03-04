//
//  CustomTabBarController.swift
//  testloginfb
//
//  Created by Juan Lopez on 4/03/18.
//  Copyright © 2018 Juan Lopez. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    let colorPrimary = UIColor(r: 204, g: 153, b: 102, a: 1)
    let colorNormal = UIColor(r: 102, g: 102, b: 102, a: 1)

    override func viewDidLoad() {
        super.viewDidLoad()

        //setup our custom view controllers
        let viewController = ViewController()
        let viewNavController = UINavigationController(rootViewController: viewController)
        viewNavController.tabBarItem.title = "Usuarios"

        let profileViewController = ProfileController()
        let profileNavController = UINavigationController(rootViewController: profileViewController)
        profileNavController.tabBarItem.title = "Perfil"

        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: colorPrimary], for: .selected)

        UITabBar.appearance().tintColor = colorPrimary

        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: colorNormal], for: .normal)


        viewControllers = [viewNavController, profileNavController]
    }
}
