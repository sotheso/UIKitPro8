//
//  ViewController.swift
//  UIKitPro6
//
//  Created by Sothesom on 03/05/1403.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlString : String
        
        if navigationController?.tabBarItem.tag == 0 {
            urlString =         "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2 .json"
        }
        
        // GCD: GCD یک ابزار است که به برنامه‌نویسان اجازه می‌دهد تا کدهای خود را به صورت همزمان (چندوظیفه‌ای) اجرا کنند. به عبارت دیگر، GCD کمک می‌کند که برنامه بتواند چند کار را همزمان انجام دهد بدون اینکه دچار کندی یا قفل شدن شود.
        DispatchQueue.global(qos: .userInitiated) .async {
            [weak self] in
            if let url = URL(string: urlString) {
                if let data = try? Data(contentsOf: url) {
                    self?.parse(json: data)
                        return
                }
            }
            self?.showError()
        }
    }
    
    func showError() {
        DispatchQueue.main.async {
            [weak self] in
            let ac = UIAlertController(title: "Lodding Error", message: "برای لود کردن صفحه مشکلی پیش آمده", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "باشه", style: .default))
            self?.present(ac, animated: true)
        }
    }
    
    func parse (json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json){
            // بارگیری داده های جیسون
            petitions = jsonPetitions.results
            
            DispatchQueue.main.async {
                [weak self] in
                self?.tableView.reloadData()

            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
         // ایجاد برچسب متن سلول و کپشن
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetaitViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true )
    }
}

