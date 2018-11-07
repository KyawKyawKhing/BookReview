//
//  ArticleDetailViewController.swift
//  BookReview
//
//  Created by AcePlus101 on 11/4/18.
//  Copyright © 2018 AcePlus. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {

    @IBOutlet weak var imgArticleImage: UIImageView!
    @IBOutlet weak var lblArticleTitle: UILabel!
    @IBOutlet weak var lblArticleDescription: UILabel!
    
    var data:Article!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgArticleImage.image = UIImage(named: data.image)
        lblArticleTitle.text = data.title
        lblArticleDescription.text = data.description
    }

    @IBAction func back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
