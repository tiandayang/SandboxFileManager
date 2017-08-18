//
//  FileListCollectionViewCell.swift
//  SandboxFileManager
//
//  Created by 田向阳 on 2017/8/17.
//  Copyright © 2017年 田向阳. All rights reserved.
//

import UIKit
import SnapKit

class FileListCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: configData
    var model: FileListModel? {
        didSet{
            self.iconView.image = model?.fileIcon;
            self.nameLabel.text = model?.fileName;
        }
    }
    
    //MARK: CreateUI
    func createUI() {
        contentView.addSubview(iconView)
        contentView.addSubview(nameLabel)
        iconView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconView.snp.bottom).offset(5)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
}
