//
//  RestrauntModel.swift
//  MYZOMATOAPP
//
//  Created by Paritosh on 11/07/19.
//  Copyright © 2019 Paritosh. All rights reserved.
//

import UIKit

struct User {
    var name: String?
    var email: String?
    
    init(){
        
    }
    
    init(name: String, email: String){
        self.name = name
        self.email = email
    }
    
    func getUserFromObject(object: [String: Any]) -> User{
        var user = User()
        if let name = object["name"] as? String{
            user.name = name
        }
        if let email = object["email"] as? String{
            user.email = email
        }
        return user
    }
}


class Users: NSObject {
//    let name: String?
//    let email: String?
//    let info: String
    
//    init(name: String, image: String, info: String) {
//        self.name=name
//        self.image=image
//        self.info=info
//    }
//
//    init() {
//        self.init(name: "Hello", image: "", info: "info")
//    }
    
    override init() {
        super.init()
    }
    
    func getData(urlString: String, completionHandler: @escaping ([User])->()) {
        var users: [User] = []
        if let url = URL(string: urlString) {
            let dataTask = URLSession.shared.dataTask(with: url) {(data, response, error) in
                guard let data = data else { return }
                let jsonData = self.convertToDictionary(data: data)
                guard let parsedJSONData = jsonData else { return }
                
                for object in parsedJSONData{
                    let user = User()
                    users.append(user.getUserFromObject(object: object)) //user.getUserFromObject(object: object)
                }
                completionHandler(users)
//                print(jsonData)
                
                //print(String(data: data, encoding: .utf8)!)
        }
        dataTask.resume()
        }
    }
    
    func convertToDictionary(data: Data?) -> [[String: Any]]? {
        guard let data = data else { return nil }
        
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
