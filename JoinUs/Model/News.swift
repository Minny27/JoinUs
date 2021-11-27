//
//  News.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/26.
//

import Foundation
import UIKit

struct News {
    let photo: Data
    let title: String
    let etc: String
    
    init(photo: Data, title: String, etc: String) {
        self.photo = photo
        self.title = title
        self.etc = etc
    }
}
