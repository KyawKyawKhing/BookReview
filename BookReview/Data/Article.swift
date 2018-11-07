//
//  Article.swift
//  BookReview
//
//  Created by AcePlus101 on 11/4/18.
//  Copyright © 2018 AcePlus. All rights reserved.
//

import Foundation
struct Article {
    var image:String = ""
    var title:String = ""
    var description:String = ""
    var releaseDate:String = ""
    
    init(image:String,title:String,description:String,releaseDate:String) {
        self.image = image
        self.title = title
        self.description = description
        self.releaseDate = releaseDate
    }
}
