//
//  MYPStyleFormatCell.swift
//  MYPMarkdownEditor
//
//  Created by wakary redou on 2018/5/26.
//

import UIKit

class MYPStyleHeaderCell: UITableViewCell {
    
    @IBOutlet var buttons: [UIButton]!
    
    weak var delegate: MYPStyleSettingProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        for button in self.buttons {
            button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc private func buttonAction(sender: UIButton) {
        let info = sender.title(for: .normal)
        var type = MYPMarkdownEditorFormattingStyle.h1
        if let x = info {
            switch x {
            case "H2":
                type = .h2
                break
            case "H3":
                type = .h3
                break
            case "H4":
                type = .h4
                break
            case "H5":
                type = .h5
                break
            case "H6":
                type = .h6
                break
            default:
                break
            }
            self.delegate?.mypMarkdownEditor_didTap(styleType: type, info: nil)
        }
    }

}
