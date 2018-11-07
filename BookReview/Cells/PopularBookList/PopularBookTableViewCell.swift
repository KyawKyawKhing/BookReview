//
//  PopularBookTableViewCell.swift
//  BookReview
//
//  Created by AcePlus101 on 11/4/18.
//  Copyright © 2018 AcePlus. All rights reserved.
//

import UIKit

class PopularBookTableViewCell: UITableViewCell {

    @IBOutlet weak var popularBookCollectionView: UICollectionView!
    @IBOutlet weak var btnViewMore: UIButton!
    
    var popularBookList = Utils.getPopularBookList()
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        Utils.cellRegister(nibName: "BookItemCollectionViewCell", collectionView: popularBookCollectionView)
        self.popularBookCollectionView.dataSource = self
        self.popularBookCollectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension PopularBookTableViewCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularBookList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookItemCollectionViewCell", for: indexPath) as! BookItemCollectionViewCell
        if let constraint = (cell.vBookTitle.constraints.filter{$0.firstAttribute == NSLayoutConstraint.Attribute.height}.first) {
            constraint.constant = true ? 0.0 : 0.0
            cell.vBookTitle.layoutIfNeeded()
            cell.vBookTitle.isHidden = true
        }
         cell.setData(data: popularBookList[indexPath.row])
        return cell
    }
    
}

extension PopularBookTableViewCell:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index:Int = indexPath.item
        print("Got clicked on index: \(index)!")
        let navigationVC = self.window?.rootViewController!.storyboard!.instantiateViewController(withIdentifier: "BookDetailViewController") as! UINavigationController
        let vc = navigationVC.viewControllers[0] as! BookDetailViewController
        vc.data = popularBookList[indexPath.row]
        self.window?.rootViewController!.present(navigationVC, animated: true, completion: nil)
    }
}
