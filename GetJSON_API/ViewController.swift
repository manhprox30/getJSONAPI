//
//  ViewController.swift
//  GetJSON_API
//
//  Created by V000232 on 8/31/20.
//  Copyright © 2020 V000232. All rights reserved.
//

import UIKit

struct  Result: Codable {
    var data: [User]
}

struct User: Codable {
    
    var userName: String
    var age: Int
    var image: String
    var gender : String
    var location: String
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    

    private var users = [User]()
    final let jsonUrlString = "http://demo0737597.mockable.io/master_data"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let nibName = UINib(nibName: "InformationViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "MyCell")
        tableView.delegate = self
        tableView.dataSource = self
        loadingJSON()
    
    }
    
    func loadingJSON()  {
        
        guard let url = URL(string: jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data  else { return}
            do {
                let result = try
                    JSONDecoder().decode(Result.self, from: data)
                self.users = result.data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                
                //                print(self.users[0].image)
                //                print(result.data[0].image)
            }catch {
                print()
            }
        }.resume()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as?  InformationViewCell else  {
            
            print("aloo")
            return UITableViewCell()
        }

        cell.lblUserName.text = "UserName: " + self.users[indexPath.row].userName
        cell.lblAge.text = "Age: : " + String(self.users[indexPath.row].age)
        cell.lblLocation.text = "Location: " + self.users[indexPath.row].location
        cell.lblGender.text = "Gender: " + self.users[indexPath.row].gender
        if let imageUrl = URL(string: users[indexPath.row].image) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageUrl)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imgAvatar.image = image
                    }

                }
            }
        }
        return cell

        }
  
    }
 




