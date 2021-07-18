//
//  MyMusicTableViewCell.swift
//  PlayMusic
//
//  Created by Lâm Nguyễn on 06/07/2021.
//  Copyright © 2021 Lâm Nguyễn. All rights reserved.
//

import UIKit

class MyMusicTableViewCell: UITableViewCell {

    @IBOutlet weak var lbnameSong: UILabel!
    @IBOutlet weak var lbnameSinger: UILabel!
    @IBOutlet weak var imageSinger: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindingData(item: Music){
        self.lbnameSong.text = item.nameSong
        self.lbnameSinger.text = item.nameSinger
        self.imageSinger.image = UIImage(named: item.imageSinger ?? "")
    }
    
}
