//
//  PostCollectionViewCell.swift
//  ui
//
//  Created by ImNotPro on 12/05/19.
//

import UIKit
import Kingfisher

class PostCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let autoLayoutAttributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        
        // Specify you want _full width_
        let targetSize = CGSize(width: layoutAttributes.frame.width, height: 0)
        
        // Calculate the size (height) using Auto Layout
        let autoLayoutSize = contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: UILayoutPriority.required, verticalFittingPriority: UILayoutPriority.defaultLow)
        let autoLayoutFrame = CGRect(origin: autoLayoutAttributes.frame.origin, size: autoLayoutSize)
        
        // Assign the new size to the layout attributes
        autoLayoutAttributes.frame = autoLayoutFrame
        return autoLayoutAttributes
    }


    func bind(_ postViewModel: PostViewModel) {
        if let imgUrl = postViewModel.imgPath {
            self.postImageView.kf.setImage(with: URL(string: imgUrl))
        }
        self.textLabel.text = postViewModel.text
        self.timestampLabel.text = postViewModel.timeStamp
    }
}
