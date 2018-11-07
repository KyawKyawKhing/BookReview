//
//  AdsTableViewCell.swift
//  BookReview
//
//  Created by AcePlus101 on 11/4/18.
//  Copyright © 2018 AcePlus. All rights reserved.
//

import UIKit

class AdsTableViewCell: UITableViewCell {

    @IBOutlet weak var imgAds: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(data:Article){
        imgAds.image = UIImage(named: data.image)
    }
    
}
