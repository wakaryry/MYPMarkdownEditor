//
//  MYPStyleFontSizeCell.swift
//  MYPMarkdownEditor
//
//  Created by wakary redou on 2018/5/26.
//

import UIKit

class MYPStyleFontSizeCell: UITableViewCell {
    
    @IBOutlet var buttons: [UIButton]!
    
    weak var delegate: MYPStyleSettingProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        for button in buttons {
            button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc private func buttonAction(sender: UIButton) {
        let size = sender.title(for: .normal)
        var xx = size?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if xx == "A" {
            xx = nil
        }
        
        self.delegate?.mypMarkdownEditor_didTap(styleType: .fontSize, info: xx)
    }

}
