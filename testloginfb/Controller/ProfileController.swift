//
//  ProfileController.swift
//  testloginfb
//
//  Created by Juan Lopez on 4/03/18.
//  Copyright © 2018 Juan Lopez. All rights reserved.
//

import UIKit

class ProfileController: UITableViewController {
    let colorPrimary = UIColor(r: 204, g: 153, b: 102, a: 1)
    let colorBlack = UIColor(r: 32, g: 32, b: 32, a: 1)

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Perfil"

        self.navigationController?.navigationBar.tintColor = colorPrimary
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.titleTextAttributes =
                [NSAttributedStringKey.foregroundColor: colorPrimary]

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
