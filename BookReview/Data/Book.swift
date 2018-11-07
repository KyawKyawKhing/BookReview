//
//  Book.swift
//  BookReview
//
//  Created by AcePlus101 on 11/4/18.
//  Copyright © 2018 AcePlus. All rights reserved.
//

import Foundation
struct Book {
    var image:String = ""
    var title:String = ""
    var author:String = ""
    var description:String = ""
    var releaseDate:String = ""
    
    init(image:String,title:String,author:String,description:String,releaseDate:String) {
        self.image = image
        self.title = title
        self.author = author
        self.description = description
        self.releaseDate = releaseDate
    }
}
