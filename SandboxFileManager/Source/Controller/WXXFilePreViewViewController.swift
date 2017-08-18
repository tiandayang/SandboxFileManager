//
//  WXXFilePreViewViewController.swift
//  SandboxFileManager
//
//  Created by 田向阳 on 2017/8/17.
//  Copyright © 2017年 田向阳. All rights reserved.
//

import UIKit
import QuickLook

class WXXFilePreViewViewController: UIViewController {

    open var filePath: String?//文件路径
    
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

    }
    
    private func initControllerFirstData() {
        
    }
    //MARK: Action
    
    //MARK: AddNotificatoin
    private func registNotification() {
        
    }
    //MARK: CreateUI
    private func createUI() {
        previewVC.delegate = self
        previewVC.dataSource = self
        previewVC.hidesBottomBarWhenPushed = true
        previewVC.view.backgroundColor = .white
        view.addSubview(previewVC.view)
        previewVC.view.frame = self.view.bounds
        self.addChildViewController(previewVC)
    }
    
    lazy var previewVC: QLPreviewController = {
        let VC = QLPreviewController()
        return VC
    }()
    //MARK: Helper
}

extension WXXFilePreViewViewController: QLPreviewControllerDataSource, QLPreviewControllerDelegate {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return  NSURL(fileURLWithPath: self.filePath!)
    }
}
