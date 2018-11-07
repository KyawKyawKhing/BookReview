//
//  BookDetailViewController.swift
//  BookReview
//
//  Created by AcePlus101 on 11/4/18.
//  Copyright © 2018 AcePlus. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    @IBOutlet weak var lblBookCover: UIImageView!
    @IBOutlet weak var lblBookTitle: UILabel!
    @IBOutlet weak var lblBookAuthor: UILabel!
    @IBOutlet weak var lblBookReleasedDate: UILabel!
    @IBOutlet weak var lblBookDescription: UILabel!
    
    var data:Book!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblBookCover.image = UIImage(named: data.image)
        lblBookTitle.text = data.title
        lblBookAuthor.text = data.author
        lblBookReleasedDate.text = data.releaseDate
        lblBookDescription.text = data.description
    }

    @IBAction func back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
