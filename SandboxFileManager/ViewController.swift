//
//  ViewController.swift
//  SandboxFileManager
//
//  Created by 田向阳 on 2017/8/17.
//  Copyright © 2017年 田向阳. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func lookForSandBox(_ sender: UIButton) {
                
        let VC = WXXFileListViewController()
        let nav = UINavigationController.init(rootViewController: VC)
        nav.navigationBar.isTranslucent = false
        self.present(nav, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
            LoadData()
        }

    private func LoadData() {
        let videoPath = Bundle.main.path(forResource: "IMG_0852", ofType: "MP4")
        let videoData = NSData.init(contentsOfFile: videoPath!)
        let videoDePath = WXXFileServer.rootPath().appending("/Documents/IMG_0852.MP4")
        if !FileManager.default.fileExists(atPath: videoDePath) {
            FileManager.default.createFile(atPath: videoDePath, contents: videoData as Data?, attributes: nil)
        }
        
        let imagePath = Bundle.main.path(forResource: "123", ofType: "jpg")
        let imageData = NSData.init(contentsOfFile: imagePath!)
        let imageDePath = WXXFileServer.rootPath().appending("/Documents/123.jpg")
        if !FileManager.default.fileExists(atPath: imageDePath) {
            FileManager.default.createFile(atPath: imageDePath, contents: imageData as Data?, attributes: nil)
        }
        
        let gifPath = Bundle.main.path(forResource: "collectionViewLayout", ofType: "gif")
        let gifData = NSData.init(contentsOfFile: gifPath!)
        let gifDePath = WXXFileServer.rootPath().appending("/Documents/collectionViewLayout.gif")
        if !FileManager.default.fileExists(atPath: gifDePath) {
            FileManager.default.createFile(atPath: gifDePath, contents: gifData as Data?, attributes: nil)
        }
        
        let excelPath = Bundle.main.path(forResource: "456", ofType: "xlsx")
        let excelData = NSData.init(contentsOfFile: excelPath!)
        let excelDePath = WXXFileServer.rootPath().appending("/Documents/456.xlsx")
        if !FileManager.default.fileExists(atPath: excelDePath) {
            FileManager.default.createFile(atPath: excelDePath, contents: excelData as Data?, attributes: nil)
        }
        
        let pdfPath = Bundle.main.path(forResource: "789", ofType: "pdf")
        let pdfData = NSData.init(contentsOfFile: pdfPath!)
        let pdfDePath = WXXFileServer.rootPath().appending("/Documents/789.pdf")
        if !FileManager.default.fileExists(atPath: pdfDePath) {
            FileManager.default.createFile(atPath: pdfDePath, contents: pdfData as Data?, attributes: nil)
        }
        
        let zipPath = Bundle.main.path(forResource: "WKWebView-JS", ofType: "zip")
        let zipData = NSData.init(contentsOfFile: zipPath!)
        let zipDePath = WXXFileServer.rootPath().appending("/Documents/WKWebView-JS.zip")
        if !FileManager.default.fileExists(atPath: zipDePath) {
            FileManager.default.createFile(atPath: zipDePath, contents: zipData as Data?, attributes: nil)
        }
        
        let audioPath = Bundle.main.path(forResource: "345", ofType: "amr")
        let audioData = NSData.init(contentsOfFile: audioPath!)
        let audioDePath = WXXFileServer.rootPath().appending("/Documents/345.amr")
        if !FileManager.default.fileExists(atPath: audioDePath) {
            FileManager.default.createFile(atPath: audioDePath, contents: audioData as Data?, attributes: nil)
        }
        
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
        let htmlData = NSData.init(contentsOfFile: htmlPath!)
        let htmlDePath = WXXFileServer.rootPath().appending("/Documents/index.html")
        if !FileManager.default.fileExists(atPath: htmlDePath) {
            FileManager.default.createFile(atPath: htmlDePath, contents: htmlData as Data?, attributes: nil)
        }
        
        let txtPath = Bundle.main.path(forResource: "shell", ofType: "rtf")
        let txtData = NSData.init(contentsOfFile: txtPath!)
        let txtDePath = WXXFileServer.rootPath().appending("/Documents/shell.rtf")
        if !FileManager.default.fileExists(atPath: txtDePath) {
            FileManager.default.createFile(atPath: txtDePath, contents: txtData as Data?, attributes: nil)
        }
        
        let folerPath = WXXFileServer.rootPath().appending("/Documents/789")
        if !FileManager.default.fileExists(atPath: folerPath) {
            do {
                try  FileManager.default.createDirectory(atPath: folerPath, withIntermediateDirectories: true, attributes: nil)
            } catch _ {}
        }
    }
    
}

