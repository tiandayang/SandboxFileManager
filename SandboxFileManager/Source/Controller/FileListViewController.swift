//
//  FileListViewController.swift
//  SandboxFileManager
//
//  Created by 田向阳 on 2017/8/17.
//  Copyright © 2017年 田向阳. All rights reserved.
//

import UIKit

class FileListViewController: UIViewController {

    open var path: String = FileServer.rootPath()
    private var dataArray: [FileListModel]?
    
    //MARK: ControllerLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initControllerFirstData()
        createUI()
        loadData()
        registNotification()
    }
    
    deinit {
        print("dealloc:",self)
    }
    
    //MARK: LoadData
    private func loadData() {
        
        DispatchQueue.global().async {
            self.dataArray = FileServer.getSubFolder(path: self.path)
            DispatchQueue.main.async {
                self.collectionView.fileListArray = self.dataArray;
            }
        }
    }
    
    private func initControllerFirstData() {
        if (navigationController?.viewControllers.count)! <= 1 {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "取消", style: .plain, target: self, action: #selector(navigationItemLeftClick))
        }
    }
    //MARK: Action
    @objc private func navigationItemLeftClick() {
        self.dismiss(animated: true, completion: nil)
    }
    //MARK: AddNotificatoin
    private func registNotification() {
        self.collectionView.didSelectRowBlock = {[weak self] (model: FileListModel) in
            if model.fileType == .folder {
                let VC = FileListViewController()
                VC.path = model.filePath
                VC.title = model.fileName
                self?.navigationController?.pushViewController(VC, animated: true)
            }else{
                let VC = FilePreViewViewController()
                VC.filePath = model.filePath
                VC.title = model.fileName
                self?.present(VC, animated: true, completion: nil)
            }
        }
    }
    //MARK: CreateUI
    private func createUI() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.zero)
        }
    }
    
    lazy var collectionView: FileListCollectionView = {
        let collectionView = FileListCollectionView()
        
        return collectionView
    }()
    //MARK: Helper

}
