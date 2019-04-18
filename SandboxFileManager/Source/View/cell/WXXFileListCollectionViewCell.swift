//
//  WXXFileListCollectionViewCell.swift
//  SandboxFileManager
//
//  Created by 田向阳 on 2017/8/17.
//  Copyright © 2017年 田向阳. All rights reserved.
//

import UIKit

protocol WXXFileListCollectionViewCellDelegate: NSObjectProtocol {
    //删除操作
    func deleteAction(fileModel: WXXFileListModel)
    //开始删除晃动动画
    func startDeleteAnimation()
}

class WXXFileListCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: WXXFileListCollectionViewCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:Action
   @objc private func deleteAction() {
        WXXCellAnimation.deleteAnimation(view: self)
    }
    
    //MARK: configData
    var model: WXXFileListModel? {
        didSet{
            self.iconView.image = model?.fileIcon;
            self.nameLabel.text = model?.fileName;
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: 50)
        nameLabel.frame = CGRect(x: 0, y: 50, width: frame.size.width, height: frame.size.height - 50)
        deleteButton.frame = CGRect(x: frame.size.width/2 - 25, y: -10, width: 20, height: 20)
    }
    
    //MARK: CreateUI
   private func createUI() {
        contentView.addSubview(iconView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(deleteButton)
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
    
    lazy var deleteButton: UIButton = {
        let button = UIButton(type: .custom)
        button.isHidden = true
        button.setImage(Bundle.getImage(imageName: "File_delete"), for: .normal)
        button.addTarget(self, action: #selector(deleteAction), for: .touchUpInside)
        return button
    }()
}

extension WXXFileListCollectionViewCell: CAAnimationDelegate {
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if anim.isKind(of: CAAnimationGroup.classForCoder()) {
            if self.delegate != nil  && self.model != nil {
                self.delegate?.deleteAction(fileModel: self.model!)
            }
        }
    }
}
