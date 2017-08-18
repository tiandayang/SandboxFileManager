//
//  FileServer.swift
//  SandboxFileManager
//
//  Created by 田向阳 on 2017/8/17.
//  Copyright © 2017年 田向阳. All rights reserved.
//

import UIKit

class FileServer: NSObject {
    
    class func getSubFolder(path: String?) -> [FileListModel] {
        var fileListArray = [FileListModel]();
        if path != nil {
            do {
             let array = try  FileManager.default.contentsOfDirectory(atPath: path!)
                if array.count > 0 {
                    for subPath in array {
                        let resultPath = path?.appending("/" + subPath)
                        let model = FileListModel()
                        model.filePath = resultPath!
                        fileListArray.append(model)
                    }
                }
            } catch _ {}
        }
        
      return fileListArray
    }
    
   class func rootPath() -> String {
        return NSHomeDirectory()
    }
}
