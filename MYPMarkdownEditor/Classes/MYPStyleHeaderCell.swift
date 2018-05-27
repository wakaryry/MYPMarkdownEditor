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
    
    private var lineLayer: CAShapeLayer = CAShapeLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.strokeColor = UIColor.lightGray.cgColor
        lineLayer.lineJoin = kCALineJoinRound
        lineLayer.lineDashPattern = [5, 2]
        lineLayer.lineWidth = 1.0
        
        self.layer.addSublayer(lineLayer)
        
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
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if !self.isSelected {
            return
        }
        
        var layerFrame = rect
        layerFrame.origin.x = 20.0
        layerFrame.origin.y = 60.0
        layerFrame.size.width = layerFrame.size.width - 20.0 * 2.0
        layerFrame.size.height = 1.0
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0.5))
        path.addLine(to: CGPoint(x: layerFrame.width, y: 0.5))
        
        self.lineLayer.path = path.cgPath
        lineLayer.frame = layerFrame
    }

}
