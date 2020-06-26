//
//  TableViewController.swift
//  TransparentNavigationControllerExample
//
//  Created by Jayson Rhynas on 2020-06-26.
//  Copyright © 2020 Jayson Rhynas. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        tableView.backgroundColor = .clear
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ModelItem.allItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let item = ModelItem.allItems[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.imageView?.image = UIImage(systemName: "info.circle.fill")
        cell.imageView?.tintColor = item.color

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        let dest = segue.destination as! InfoViewController
        if let index = self.tableView.indexPathForSelectedRow?.item {
            dest.item = ModelItem.allItems[index]
        }
    }
}
