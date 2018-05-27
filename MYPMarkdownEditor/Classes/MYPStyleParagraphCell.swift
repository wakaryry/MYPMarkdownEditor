//
//  MYPStyleParagraphCell.swift
//  MYPMarkdownEditor
//
//  Created by wakary redou on 2018/5/26.
//

import UIKit

class MYPStyleParagraphCell: UITableViewCell {
    
    @IBOutlet var alignLeftButton: UIButton!
    @IBOutlet var alignCenterButton: UIButton!
    @IBOutlet var alignRightButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
