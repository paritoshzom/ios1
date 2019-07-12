//
//  MyTableViewCell.swift
//  MYZOMATOAPP
//
//  Created by Paritosh on 11/07/19.
//  Copyright © 2019 Paritosh. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
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
        
    }
    
    public func setData(user: User){
        mainImageView.backgroundColor = .red
        titleLabel.text = user.name
        subtitleLabel.text = user.email
    }
}
