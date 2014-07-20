//
//  C_Data.swift
//  Knowli3-Reader
//
//  Created by 서 동훈 on 2014. 7. 9..
//  Copyright (c) 2014년 서 동훈. All rights reserved.
//

import Foundation
import UIKit

class C_Data {
    var idx: Int = 0
    var content: String = ""
    var uid: String = ""
    var regDate: String = ""
    var grade: Int = 0
    var nickName: String = ""
    var thumbnail: String = ""
    
    init(idx: Int,
        content: String,
        uid: String,
        regDate: String,
        grade: Int,
        nickName: String,
        thumbNail: String){
            self.idx = idx
            self.content = content
            self.uid = uid
            self.regDate = regDate
            self.grade = grade
            self.nickName = nickName
            self.thumbnail = thumbNail
    }
    
    //var imageView: UIImage
    //var title: String = ""
    //var content: String = ""
//    init(title: String, content: String, imageView: UIImage) {
//        self.title = title
//        self.content = content
//        self.imageView = imageView
//    }
}