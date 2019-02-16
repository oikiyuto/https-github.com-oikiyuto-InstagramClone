//
//  PostTableViewCell.swift
//  InstagramClone
//
//  Created by yutos on 2019/02/09.
//  Copyright © 2019 yutos. All rights reserved.
//

import UIKit
import Firebase

class PostTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource{
   
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var commentCount:Int = 0
    var commentSetHere:[[String:String]] = [[:]]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! commentTableViewCell
        
  
        return cell
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("debug:awakefromnib")
        let nib = UINib(nibName: "commentTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PostCell")
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
    }
    
    func setPostData(_ postData: PostData) {
        self.postImageView.image = postData.image
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = formatter.string(from: postData.date!)
        self.dateLabel.text = dateString
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
        
        if postData.comment != nil{
          commentCount = postData.comment!.count
        }
        commentSetHere = postData.commentSet
        
    }
}
