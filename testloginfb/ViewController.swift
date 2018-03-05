//
//  ViewController.swift
//  testloginfb
//
//  Created by Juan Lopez on 3/03/18.
//  Copyright © 2018 Juan Lopez. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UITableViewController {
    let colorPrimary = UIColor(r: 204, g: 153, b: 102, a: 1)
    let colorBlack = UIColor(r: 32, g: 32, b: 32, a: 1)

    var userArray = [UserModel]()
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Usuarios"

        self.navigationController?.navigationBar.tintColor = colorPrimary
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.titleTextAttributes =
                [NSAttributedStringKey.foregroundColor: colorPrimary]

        validateLoginFB()
        setValuesTest()
    }

    func validateLoginFB() {
        let accessToken = FBSDKAccessToken.current()
        if accessToken == nil {
            let loginController = LoginViewController()
            self.present(loginController, animated: true, completion: nil)
        }

        guard let accessTokenString = accessToken?.tokenString else {
            return
        }

        print(accessTokenString)
    }

    func setValuesTest() {
        let userTemp: UserModel = UserModel()
        userTemp.name = "Juan"
        userTemp.lastName = "Lopez"
        userTemp.phone = "32002923"
        userTemp.year = "21"
        userTemp.position = "0,0"
        self.userArray.append(userTemp)
        self.tableView.reloadData()
    }

    func showDetalContent(_ conten: UserModel) {
        let subViewController = SubViewController()
        subViewController.item = conten
        navigationController?.pushViewController(subViewController, animated: true)
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }

    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        let dict = userArray[indexPath.row]
        showDetalContent(dict)
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let use a hack for now
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)

        let dict = userArray[indexPath.row]
        cell.textLabel?.text = "Nombre: \(dict.name) \(dict.lastName)"

        cell.textLabel?.textColor = UIColor.black

        cell.detailTextLabel?.text = "Edad: \(dict.year)"
        cell.detailTextLabel?.textColor = UIColor(r: 128, g: 129, b: 132, a: 1)


        return cell
    }

}

