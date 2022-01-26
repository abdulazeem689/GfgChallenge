//
//  TopFeedTVCell.swift
//  GfgChallenge
//
//  Created by Flexnest on 26/01/22.
//

import UIKit

class TopFeedTVCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var thumbnailImgVw: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        contentView.frame = contentView.frame.inset(by: margins)
        contentView.layer.cornerRadius = 16
    }
    
    func setupUI(feed: FeedItem) {
        titleLbl.text = feed.title ?? ""
        ImageService().getImage(urlString: feed.enclosure?.link ?? "") { image in
            self.thumbnailImgVw.image = image
        }
        dateLbl.attributedText = Helpers.formattedDate(string: feed.pubDate ?? "", isTop: true)
    }
    
}
