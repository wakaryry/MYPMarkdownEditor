//
//  MYPStyleFontStyleCell.swift
//  MYPMarkdownEditor
//
//  Created by wakary redou on 2018/5/26.
//

import UIKit

class MYPStyleFontStyleCell: UITableViewCell {
    
    @IBOutlet weak var boldButton: UIButton!
    @IBOutlet weak var italicButton: UIButton!
    @IBOutlet weak var underlineButton: UIButton!
    @IBOutlet weak var strikethroughButton: UIButton!
    
    weak var delegate: MYPStyleSettingProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        for button in [boldButton, italicButton, underlineButton, strikethroughButton] {
            button?.addTarget(self, action: #selector(buttonAction(sender:)), for: UIControlEvents.touchUpInside)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc private func buttonAction(sender: UIButton) {
        var type = MYPMarkdownEditorFormattingStyle.bold
        
        if sender == italicButton {
            type = .italic
        }
        else if sender == underlineButton {
            type = .underline
        }
        else if sender == strikethroughButton {
            type = .strikethrough
        }
        
        self.delegate?.mypMarkdownEditor_didTap(styleType: type, info: nil)
    }

}
