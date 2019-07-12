//
//  MyTableViewCell.swift
//  MYZOMATOAPP
//
//  Created by Paritosh on 11/07/19.
//  Copyright © 2019 Paritosh. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    let URL_IMAGE = URL(string: "https://images-na.ssl-images-amazon.com/images/I/61NwVvpV33L.png")
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let mainImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style,reuseIdentifier: reuseIdentifier)
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(mainImageView)
        
        mainImageView.layer.cornerRadius = 20
        mainImageView.set(.top(contentView,12),
                          .width(40),
                          .height(40),
                          .leading(contentView,12),
                          .bottom(contentView,12))
        
        titleLabel.set(.after(mainImageView,12),
                       .top(mainImageView),
                       .trailing(contentView,12))
        
        subtitleLabel.set(.sameLeadingTrailing(titleLabel),
                          .below(titleLabel,5))
        
        
        let getImageFromUrl = URLSession.shared.dataTask(with: URL_IMAGE!) { (data, response, error) in
            
            //if there is any error
            if let e = error {
                //displaying the message
                print("Error Occurred: \(e)")
                
            } else {
                //in case of now error, checking wheather the response is nil or not
                if (response as? HTTPURLResponse) != nil {
                    
                    //checking if the response contains an image
                    if let imageData = data {
                        
                        //getting the image
                        let image = UIImage(data: imageData)
                        
                        //displaying the image
                        self.mainImageView.image = image
                        
                    } else {
                        print("Image file is currupted")
                    }
                } else {
                    print("No response from server")
                }
            }
        }
        
        //starting the download task
        getImageFromUrl.resume()
        
        
    }
    
    public func setData(user: User){
        mainImageView.backgroundColor = .none
        titleLabel.text = user.name
        subtitleLabel.text = user.email
    }
}
