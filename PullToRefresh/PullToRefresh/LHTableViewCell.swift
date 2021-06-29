//
//  LHTableViewCell.swift
//  PullToRefresh
//
//  Created by LH on 2021/6/24.
//

import UIKit
import SnapKit

class LHTableViewCell: UITableViewCell {
    private var model:DetailModel = DetailModel()
    var cellModel:DetailModel {
        set {
            model = newValue
            self.nameLable.text = model.contentText
            
        }
        get {
            return self.model
        }
    }
    
    lazy var nameLable = {() -> UILabel in
        let nameLable = UILabel.init()
        nameLable.backgroundColor = UIColor.lightGray
        nameLable.font = UIFont.systemFont(ofSize: 12)
        nameLable.numberOfLines = 0
        return nameLable
    }()
    
    lazy var lineLabel = {() -> UILabel in
        let lineLabel = UILabel.init()
        lineLabel.backgroundColor = UIColor.lightGray
        return lineLabel
    }()
    
    
    lazy var avatarImg = {() -> UIImageView in
        let avatarImg = UIImageView.init()
        avatarImg.backgroundColor = UIColor.red
        return avatarImg
    }()
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.avatarImg)
        self.contentView.addSubview(self.nameLable)
        self.contentView.addSubview(self.lineLabel)
        self.avatarImg.layer.cornerRadius = 5;
        self.avatarImg.layer.masksToBounds = true
        
        self.nameLable.layer.cornerRadius = 3;
        self.nameLable.layer.masksToBounds = true
        
        
        addSnap()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSnap() {
        self.avatarImg.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.top.equalTo(15)
            make.width.height.equalTo(55)
        }
        self.nameLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.avatarImg.snp_right).offset(10)
            make.right.equalTo(self.contentView.snp.right).offset(-15)
            make.top.height.equalTo(self.avatarImg)
        }
        self.lineLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.avatarImg)
            make.right.equalTo(self.nameLable.snp.right)
            make.height.equalTo(1)
            make.bottom.equalTo(self.contentView.snp_bottom)
        }
    }
    
}
