//
//  MYPStyleFontStyleCell.swift
//  MYPMarkdownEditor
//
//  Created by wakary redou on 2018/5/26.
//

import UIKit

class MYPStyleFontStyleCell: UITableViewCell {
    
    @IBOutlet var boldButton: UIButton!
    @IBOutlet var italicButton: UIButton!
    @IBOutlet var underlineButton: UIButton!
    @IBOutlet var strikethroughButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
