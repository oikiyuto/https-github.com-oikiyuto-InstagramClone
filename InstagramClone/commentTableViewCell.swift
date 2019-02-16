//
//  commentTableViewCell.swift
//  InstagramClone
//
//  Created by yutos on 2019/02/13.
//  Copyright © 2019 yutos. All rights reserved.
//

import UIKit
import Firebase

class commentTableViewCell: UITableViewCell {

    @IBOutlet weak var commentId: UILabel!
    @IBOutlet weak var comment: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    func setPostData(_ postData: PostData) {
        
    }
        
    
    
    
}
