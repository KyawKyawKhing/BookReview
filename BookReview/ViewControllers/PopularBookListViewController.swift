//
//  PopularBookListViewController.swift
//  BookReview
//
//  Created by AcePlus101 on 11/4/18.
//  Copyright © 2018 AcePlus. All rights reserved.
//

import UIKit

class PopularBookListViewController: UIViewController {

    @IBOutlet weak var popularBookCollectionView: UICollectionView!
    var popularBookList = Utils.getPopularBookList()
    var position:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utils.cellRegister(nibName: "BookItemCollectionViewCell", collectionView: popularBookCollectionView)
        
        self.popularBookCollectionView.dataSource = self
        self.popularBookCollectionView.delegate = self
    }

    @IBAction func back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
extension PopularBookListViewController:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let navigationVC = self.storyboard!.instantiateViewController(withIdentifier: "BookDetailViewController") as! UINavigationController
        let vc = navigationVC.viewControllers[0] as! BookDetailViewController
        vc.data = popularBookList[indexPath.row]
        self.present(navigationVC, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width/2-15
        return CGSize(width: width, height: width*1.5)
    }
}

extension PopularBookListViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularBookList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookItemCollectionViewCell", for: indexPath) as! BookItemCollectionViewCell
        cell.setData(data: popularBookList[indexPath.row])
        return cell
    }
}
