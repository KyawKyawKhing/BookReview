//
//  BookItemCollectionViewCell.swift
//  BookReview
//
//  Created by AcePlus101 on 11/4/18.
//  Copyright © 2018 AcePlus. All rights reserved.
//

import UIKit

class BookItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ivBookImage: UIImageView!
    @IBOutlet weak var lblBookTitle: UILabel!
    @IBOutlet weak var vBookTitle: UIView!
    
    var data:Book!
    
    override func awakeFromNib() {
        super.awakeFromNib()}
    
    func setData(data:Book) {
        ivBookImage.image = UIImage(named: data.image)
        lblBookTitle.text = data.title
    }
}
