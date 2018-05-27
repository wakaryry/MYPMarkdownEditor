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
    
    weak var delegate: MYPStyleSettingProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        for button in [alignLeftButton, alignCenterButton, alignRightButton] {
            button?.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc private func buttonAction(sender: UIButton) {
        var type = MYPMarkdownEditorFormattingStyle.alignLeft
        
        if sender == self.alignCenterButton {
            type = .alignCenter
        }
        else if sender == self.alignRightButton {
            type = .alignRight
        }
        
        self.delegate?.mypMarkdownEditor_didTap(styleType: type, info: nil)
    }

}
