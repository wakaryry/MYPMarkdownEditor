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
    
    private var lineLayer: CAShapeLayer = CAShapeLayer()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        for button in buttons {
            button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        }
        
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.strokeColor = UIColor.lightGray.cgColor
        lineLayer.lineJoin = kCALineJoinRound
        lineLayer.lineDashPattern = [5, 2]
        lineLayer.lineWidth = 1.0
        
        self.layer.addSublayer(lineLayer)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc private func buttonAction(sender: UIButton) {
        let size = sender.title(for: .normal)
        let xx = size?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if xx == "A" {
            self.delegate?.mypMarkdownEditor_didTap(styleType: .fontSize, info: nil)
            return
        }
        
        self.delegate?.mypMarkdownEditor_didTap(styleType: .fontSize, info: ["info": xx!])
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
