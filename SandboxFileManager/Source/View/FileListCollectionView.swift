//
//  FileListCollectionView.swift
//  SandboxFileManager
//
//  Created by 田向阳 on 2017/8/17.
//  Copyright © 2017年 田向阳. All rights reserved.
//

import UIKit

private let numberOfRow = 3;
private let itemSpace = 10;

class FileListCollectionView: UIView {

    open var didSelectRowBlock: ((_ model: FileListModel)->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Action
    
    var fileListArray: [FileListModel]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    //MARK: CreateUI
    func createUI() {
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.zero)
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let space = CGFloat(itemSpace);
        layout.minimumLineSpacing = space;
        layout.minimumInteritemSpacing = space;
        layout.sectionInset = UIEdgeInsetsMake(space, space, space, space)
        
        let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FileListCollectionViewCell.self, forCellWithReuseIdentifier: "FileListCollectionViewCell")
        return collectionView
    }()
}

extension FileListCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.fileListArray != nil {
            return (self.fileListArray?.count)!
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FileListCollectionViewCell", for: indexPath) as! FileListCollectionViewCell
        let model = self.fileListArray?[indexPath.row]
        cell.model = model
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.didSelectRowBlock != nil {
            let model = self.fileListArray?[indexPath.row]
            self.didSelectRowBlock!(model!)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.frame.size.width
        let itemWidth = (collectionWidth - CGFloat(itemSpace * 2) - CGFloat((numberOfRow - 1) * 10))/CGFloat(numberOfRow) - 0.1;
        return CGSize(width: itemWidth, height: itemWidth)
    }
}
