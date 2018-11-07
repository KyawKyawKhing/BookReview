//
//  ArticleListTableViewCell.swift
//  BookReview
//
//  Created by AcePlus101 on 11/4/18.
//  Copyright © 2018 AcePlus. All rights reserved.
//

import UIKit

class ArticleListTableViewCell: UITableViewCell {

    @IBOutlet weak var articleListTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        Utils.cellRegister(nibName: "ArticleTableViewCell", tableView: articleListTableView)
        
        self.articleListTableView.dataSource = self
        self.articleListTableView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ArticleListTableViewCell:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath)
        return cell
    }
    
    
}

extension ArticleListTableViewCell:UITableViewDelegate{
    
}
