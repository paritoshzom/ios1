//
//  ViewController.swift
//  MYZOMATOAPP
//
//  Created by Paritosh on 11/07/19.
//  Copyright © 2019 Paritosh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let universalName = "mycell"
//    let arrayOfres = [Users(name:"one",image:"",info:"sub one"),Users(name:"two",image:"",info:"sub two")]
    var arrayOfUsers: [User] = []
    let tableView = UITableView(frame: .zero)
    override func viewDidLoad() {
        super.viewDidLoad()
        let users = Users()
        users.getData(
            urlString: "https://jsonplaceholder.typicode.com/users"
            
        ) { (users) in
            self.arrayOfUsers = users
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        createList()
    }
    
    func createList() {
        view.addSubview(tableView)
        
        tableView.set(.fillSuperView(view))
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: universalName)
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "empty")
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: universalName, for: indexPath) as! MyTableViewCell
        cell.setData(user: arrayOfUsers[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(arrayOfUsers[indexPath.row])
    }
    
    func createView() {
        let redView = UIView()
        redView.backgroundColor = .red
        view.addSubview(redView)
        
        redView.set(.top(view,50),
                    .sameLeadingTrailing(view,12),
                    .height(200))
        
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow
        view.addSubview(yellowView)
        
        yellowView.set(.below(redView,12),
                       .leading(view,12),
                       .width(30),
                       .height(200))
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        view.addSubview(greenView)
        
        greenView.set(.after(yellowView,12),
                      .below(redView,12),
                      .trailing(view,12),
                      .height(200))
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        
        blueView.set(.below(yellowView,12),
                     .trailing(view,12),
                     .width(30),
                     .height(200))
        
        let orangeView = UIView()
        orangeView.backgroundColor = .orange
        view.addSubview(orangeView)
        
        orangeView.set(.below(yellowView,12),
                       .before(blueView,12),
                       .height(200),
                       .leading(view,12))
        
        
    }


}

