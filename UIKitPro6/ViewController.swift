//
//  ViewController.swift
//  UIKitPro6
//
//  Created by Sothesom on 03/05/1403.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
         // ایجاد برچسب متن سلول و کپشن
        cell.textLabel?.text = "Title"
        cell.detailTextLabel?.text = "Suntitle"
        return cell
    }
}

