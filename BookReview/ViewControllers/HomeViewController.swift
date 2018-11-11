//
//  HomeViewController.swift
//  BookReview
//
//  Created by AcePlus101 on 11/4/18.
//  Copyright © 2018 AcePlus. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    let adsData = Article(image: "book1", title: "The Daughter", description: """
As the Rohingya crisis exploded, longtime observers of Myanmar were shocked to see Aung San Suu Kyi, champion for the causes of liberal democracy and human rights, stand by as atrocities tore through the western reaches of her country. The Daughter is a timely in-depth exploration of this icon-turned-leader and of the people, ideas, and experiences that have shaped her political identity. What emerges is not a shift in ideology but a consistent picture of the contrasts and multidimensionality that have defined her—prisoner and leader, principled resistor and pragmatic politician, the Lady and Mother Suu.

Newly translated and updated from the original German, The Daughter is essential reading for the professionals, journalists, and other observers seeking to understand Aung San Suu Kyi’s role in Myanmar. Dozens of photos complement the nuanced analysis and further illustrate the lifelong political journey of Aung San Suu Kyi.

Highlights

Analyzes Aung San Suu Kyi’s political development both before and after she took power in Myanmar.
Includes her response to the Rohingya crisis and discusses underlying motivations.
Explores the public and private roles of her parents the national hero Aung San and his wife,
Khin Kyi.
Takes a nonideological approach to achieve a balanced insightful understanding of Aung San Suu Kyi’s political persona.
""", releaseDate: "04-11-2018")
    
    var popularBookList = Utils.getPopularBookList()
    var articleList = Utils.getBookArticleList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utils.cellRegister(nibName: "AdsTableViewCell", tableView: homeTableView)
        Utils.cellRegister(nibName: "PopularBookTableViewCell", tableView: homeTableView)
        Utils.cellRegister(nibName: "ArticleTitleTableViewCell", tableView: homeTableView)
        Utils.cellRegister(nibName: "ArticleTableViewCell", tableView: homeTableView)
        
        self.homeTableView.dataSource = self
        self.homeTableView.delegate = self
        
    }

}

extension HomeViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 1{
    let clickCell = cell as! PopularBookTableViewCell
            clickCell.btnViewMore?.tag = indexPath.item
            clickCell.btnViewMore?.addTarget(self,action: #selector(HomeViewController.clickViewMore(_:)),for: UIControl.Event.touchUpInside)
        }
    }
    
    @objc func clickViewMore(_ sender:UIButton!){
        let navigationVC = self.storyboard!.instantiateViewController(withIdentifier: "PopularBookListViewController") as! UINavigationController
        self.present(navigationVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            tableView.deselectRow(at: indexPath, animated: true)
            let navigationVC = self.storyboard!.instantiateViewController(withIdentifier: "ArticleDetailViewController") as! UINavigationController
            let vc = navigationVC.viewControllers[0] as! ArticleDetailViewController
            vc.data = adsData
            self.present(navigationVC, animated: true, completion: nil)
        }
        
        if indexPath.section == 3 {
            tableView.deselectRow(at: indexPath, animated: true)
            let navigationVC = self.storyboard!.instantiateViewController(withIdentifier: "ArticleDetailViewController") as! UINavigationController
            let vc = navigationVC.viewControllers[0] as! ArticleDetailViewController
            vc.data = articleList[indexPath.row]
            self.present(navigationVC, animated: true, completion: nil)
        }
    }
}

extension HomeViewController:UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if section == 1 {
            return 1
        }
        if section == 2 {
            return 1
        }
        return articleList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdsTableViewCell", for: indexPath) as! AdsTableViewCell
            cell.setData(data:adsData)
        return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PopularBookTableViewCell", for: indexPath)
           cell.selectionStyle = .none
            return cell
        }else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTitleTableViewCell", for: indexPath)
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
            cell.setData(data:articleList[indexPath.row])
            return cell
        }
    }
    
    
}
