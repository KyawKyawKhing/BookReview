//
//  ArticleTableViewCell.swift
//  BookReview
//
//  Created by AcePlus101 on 11/4/18.
//  Copyright © 2018 AcePlus. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var imgArticleImage: UIImageView!
    @IBOutlet weak var lblArticleTitle: UILabel!
    @IBOutlet weak var lblArticleDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(data:Article){
        imgArticleImage.image = UIImage(named: data.image)
        lblArticleTitle.text = data.title
        lblArticleDescription.text = data.description
    }
    
}
